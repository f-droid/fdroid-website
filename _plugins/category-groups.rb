# frozen_string_literal: true

require 'net/http'
require 'json'
require 'uri'
require 'yaml'

#
# Fetches the category groups from `fdroid/fdroidclient` source code repo on GitLab along with their localized xml string resources
# if `category_groups` is not explicitly supplied in _config.yml
#
module FDroid
  module Client
    GITLAB_ROOT = 'https://gitlab.com'
    GITLAB_WEB_DL = "/%{repo}/-/raw/%{ref}/%{path}"
    GITLAB_API_LS_ALL = "/api/v4/projects/%{repo_enc}/repository/tree?ref=%{ref}&recursive=true&pagination=none&path=%{path}"
    REPO = 'fdroid/fdroidclient'
    REPO_ENC = URI.encode_www_form_component(REPO)
    REF = 'master'

    class CategoryGroups
      CATEGORY_GROUP_KT = 'app/src/main/kotlin/org/fdroid/ui/categories/CategoryGroup.kt'
      CATEGORY_ITEM_KT = 'app/src/main/kotlin/org/fdroid/ui/categories/CategoryItem.kt'
      RES_DIR = 'app/src/main/res'
      STRINGS_XML = "#{RES_DIR}/values/strings.xml"

      def self.trim(line, from = 0, to = line.length)
        i = from
        j = to - 1
        start = true
        while start ? i < to : j >= from
          c = line[start ? i : j]
          if start
            start = false
            next
          else
            break
          end unless c == "\n" || c == ' ' || c == '"' || c == '\'' || c == ','
          if start
            i = i.succ
          else
            j = j.pred
          end
        end
        line[i..j]
      end

      def self.parse_kt_by_indent(body, *start, callback)
        indents = Array.new(start.length)
        level = 0
        body.each_line do |line|
          indent = indents[level]
          if indent
            next if line.length == 0 || line[0] == "\n"

            unless line.start_with?(indent) && line[indent.length] == ' '
              indents[level] = nil
              level = level.pred
              break if level < 0

              redo
            end
            if level.succ < indents.length && (pos = line.index(start[level.succ]))
              level = level.succ
              indents[level] = line[0, pos]
            end
            callback.call(line, indents[level], level)
          elsif (pos = line.index(start[level]))
            indents[level] = line[0, pos]
          end
        end
      end

      def self.get_category_groups
        @category_groups ||= {}
      end

      def self.parse_category_groups(body)
        group = nil
        group_name = nil
        callback = Proc.new do |line, indent, _|
          line.chomp!
          if group
            if line.end_with?(')') && group_name
              get_category_groups[group_name] = group
              group = nil
              group_name = nil
            elsif (pos = line.index('='))
              key = trim(line, indent.length, pos)
              value = trim(line, pos + 1)
              group[key] = value
            end
          elsif line.index('val ') == indent.length && (pos = line.index('='))
            group_name = trim(line, indent.length + 4, pos)
            group = {}
          end
        end
        parse_kt_by_indent body, 'object CategoryGroups', 'val ', callback
      end

      def self.get_category_items
        @category_items ||= {}
      end

      PARSE_CATEGORY_ITEMS_CALLBACK = Proc.new do |line, indent, _|
        if (pos = line.index(' -> '))
          category = trim(line, indent.length, pos)
          category_group = trim(line, pos + 4)
          get_category_items[category] = category_group
          category_group.delete_prefix!('CategoryGroups.')
          if (group = get_category_groups[category_group])
            if category == 'else'
              group['fallback'] = true
            else
              (group['categories'] ||= []) << category
            end
          end
        end
      end

      def self.parse_category_items(body)
        parse_kt_by_indent body, 'val group: CategoryGroup', PARSE_CATEGORY_ITEMS_CALLBACK
      end

      def self.get_strings
        @strings ||= {}
      end

      def self.unescape_android_xml_string!(string)
        string&.gsub!('\\\'', '\'')
      end

      def self.parse_strings(body, lang)
        strings = (get_strings[lang] ||= {})
        body.each_line do |line|
          if (pos = line.index('<string name="category_group_'))
            sep = line.index('>', pos)
            key = trim(line, pos + 13, sep)
            value = trim(line, sep + 1, line.index('</string>', sep))
            unescape_android_xml_string!(value)
            strings[key] = value
          end
        end
      end

      def self.get_category_groups_mapping
        @category_groups_mapping ||= {}
      end

      def self.process_category_groups(sort_by_name = true, full = false)
        mapping = get_category_groups_mapping
        groups = get_category_groups
        keys = groups.keys
        if sort_by_name
          strings = get_strings['en']
          keys.sort_by! do |key|
            name = groups[key]['name']
            if name&.start_with?('R.string.')
              name = strings[name[9..-1]]
            end
            (name || key).to_s.downcase
          end
        end
        i = 0
        len = keys.length
        while i < len
          key = keys[i]
          group = groups[key]
          if full
            mapping[key] = group.transform_values do |value|
              value.is_a?(String) && value.start_with?('R.string.') ? value[9..-1] : value
            end
          else
            mapping[key] = group['categories']
          end
          i = i.succ
        end
        mapping unless mapping.empty?
      end

      def self.get_strings_locales(body, site_languages, callback)
        res_locales = {}
        res_dir = JSON.parse(body)
        res_dir.each do |entry|
          if entry['type'] == 'blob' && entry['name'] == 'strings.xml' && (path = entry['path']).index('values-', RES_DIR.length) == RES_DIR.length + 1
            pos = RES_DIR.length + 8
            locale = path[pos...path.index('/', pos) || path.length]
            locale.sub!(locale.delete_prefix!('b+') ? '+' : '-r', '-')
            res_locales[locale] = path
          end
        end
        locales_to_dl = []
        site_languages.each do |site_locale|
          locales_to_dl |= FDroid::Utils.available_locales(site_locale, res_locales)
        end
        locales_to_dl.each do |locale|
          callback.call(locale, res_locales[locale])
        end
      end

      def self.list_files(http, path, headers = nil, ref = REF)
        Jekyll::logger.debug 'category-groups:', "Listing directory at '#{path}'"
        response = http.request_get(GITLAB_API_LS_ALL % { repo_enc: REPO_ENC, ref: ref, path: path }, headers)
        raise "Failed to list directory: #{response.code} #{response.message}" unless response.code == '200'

        response
      end

      def self.download_file(http, path, headers = nil, ref = REF)
        Jekyll::logger.debug 'category-groups:', "Downloading file '#{path}'"
        response = http.request_get(GITLAB_WEB_DL % { repo: REPO, ref: ref, path: path }, headers)
        raise "Failed to download file: #{response.code} #{response.message}" unless response.code == '200'

        response.body&.force_encoding(response['content-type'][/charset=([^;]+)/, 1] || 'UTF-8')
        response
      end

      def self.fetch_client_category_groups(site_languages)
        uri = URI.parse(GITLAB_ROOT)
        headers = { 'Host' => uri.host }
        Jekyll::logger.info 'category-groups:', "Fetching category groups from #{REPO} repo on GitLab"
        Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
          response = download_file(http, CATEGORY_GROUP_KT, headers)
          parse_category_groups response.body
          response = download_file(http, CATEGORY_ITEM_KT, headers)
          parse_category_items response.body
          response = download_file(http, STRINGS_XML, headers)
          parse_strings response.body, 'en'
          response = list_files(http, RES_DIR, headers)
          get_strings_locales(response.body, site_languages, Proc.new do |locale, path|
            begin
              response = download_file(http, path, headers)
              parse_strings response.body, locale
            rescue
              Jekyll::logger.warning 'category-groups:', "Failed to download '#{path}', skipping locale '#{locale}'"
            end
          end)
        end
        process_category_groups
      end

      def self.get_i18n(strings, locales, key)
        i = 0
        len = locales.length
        while i < len
          if (value = strings.dig(locales[i], key))
            return value
          end

          i = i.succ
        end
      end

      def self.fetch_client_category_groups_strings(site_language, full = true)
        strings = get_strings
        locales = FDroid::Utils.available_locales(site_language, strings)
        Jekyll::logger.debug 'category-groups:', "Resolving strings in the order of locales preference: #{locales.inspect}"
        group_names_i18n = {}
        get_category_groups.each do |key, group|
          if full
            value = nil
            group.each do |k, v|
              (value ||= {})[k] = get_i18n(strings, locales, v[9..-1]) if v.is_a?(String) && v.start_with?('R.string.')
            end
            group_names_i18n[key] = value if value
          else
            name = group['name']
            if name&.start_with?('R.string.')
              key = name[9..-1]
              name_i18n = get_i18n(strings, locales, key)
              group_names_i18n[strings['en'][key]] = name_i18n if name_i18n
            end
          end
        end
        { 'category_groups' => group_names_i18n } unless group_names_i18n.empty?
      end
    end
  end
end

Jekyll::Hooks.register :site, :after_init do |site|
  unless site.config['category_groups'] || !(mapping = FDroid::Client::CategoryGroups.fetch_client_category_groups(site.config['languages']))
    site.config['category_groups'] = mapping
    Jekyll::logger.info 'category-groups:', "Loaded #{mapping.length} category groups from #{FDroid::Client::REPO} repo"
    Jekyll::logger.info YAML.dump(site.config['category_groups'])
  end
end

Jekyll::Hooks.register :site, :post_read do |site|
  unless site.data.dig('strings', 'category_groups')
    Jekyll::logger.debug 'category-groups:', "Resolving localized category groups strings for '#{site.active_lang}'"
    if (strings = FDroid::Client::CategoryGroups.fetch_client_category_groups_strings(site.active_lang))
      (site.data['strings'] ||= {}).update(strings)
    end
    Jekyll::logger.debug JSON.pretty_generate(strings)
  end
end
