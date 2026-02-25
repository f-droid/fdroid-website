# frozen_string_literal: true

module FDroid
  module LocaleDataSource
    class Python3Babel
      def self.load_data(bloom = nil, config = nil)
        require 'open3'

        test_python_babel = <<-EOS
from babel import core

try:
    # Requires Babel 2.18+
    v = core.get_cldr_version()
except:
    v = 'unknown'
print('OK:', 'Unicode CLDR version', v)
EOS
        puts "Checking if Python Babel is present: "
        stdout, status = Open3.capture2('python3', '-c', test_python_babel)
        raise "Error: #{status}" unless status.success?
        puts stdout

        try_piggyback_locales_data_from_babel = <<-EOS
from babel.core import get_global

print('likely_subtags:')
for k, v in get_global('likely_subtags').items():
    print(k.replace('_', '-') + '=' + v.replace('_', '-'))
print('EOF')

print('language_aliases:')
new_to_old_aliases = {}
for k, v in get_global('language_aliases').items():
    new_to_old_aliases.setdefault(v, []).append(k)
for k, v in sorted(new_to_old_aliases.items()):
    print(k.replace('_', '-') + '=' + ','.join(sorted(v)))
EOS
        data = {}
        k = nil
        v = nil
        add_data = Proc.new do
          data[k.nil? ? data.length : k] = v
          k = nil
          v = nil
        end
        Open3.popen2('python3', '-c', try_piggyback_locales_data_from_babel) do |stdin, stdout, status|
          stdout.each_line do |line|
            line.chomp!
            if line.end_with?(':')
              k = line[0..-2]
            elsif line == 'EOF'
              add_data.call
            elsif bloom.nil? || FDroid::LocaleChooser.parse_locale(line, bloom, '='.ord) >= 0
              d = v ||= {}
              key, value = line.split('=', 2)
              d[key] = value
            end
          end
          raise "Error: #{status.value}" unless status.value.success?
        end
        add_data.call unless v.nil? || v.empty?
        data
      end
    end
  end

  module Resolver
    class CacheLookup
      def self.get_likely_subtags_for_lang(resolver, locale, locale_string, query_mask = nil, lang_cache = nil, lang = nil)
        return lang_cache[LANG_LIKELY_SUBTAGS].first
      end

      def self.get_likely_subtags_for_lang_part(resolver, locale, locale_string, query_mask = nil, lang_cache = nil, component = nil, lang = nil, part_string = nil)
        return nil unless lang_cache[LANG_LIKELY] & 1 << component != 0
        llcache = lang_cache[LANG_LIKELY_SUBTAGS]
        m = lang_cache[LANG_LIKELY]
        i = 1
        len = llcache.length
        a_p = FDroid::LocaleChooser.get_part(locale, component, locale_string)
        while i < len
          if (m & 1 << CODA_LEN + i != 0) == (component == SCRIPT)
            l = llcache[i]
            r = FDroid::LocaleChooser.compare_part(FDroid::LocaleChooser.get_part(parse_locale(resolver, l, lang_cache), component, l), l, a_p, locale_string)
            return r == 0 ? l : nil if r >= 0
          end
          i = i.succ
        end
        return nil
      end

      def self.parse_locale(resolver, locale, lang_cache = nil, lang = nil)
        FDroid::LocaleChooser.parse_locale(locale)
      end

      def self.init(lang_cache = nil, lang = nil)
        lang_cache && lang_cache[LANG_RESOLVER] == 1
      end

      def self.post_process_locales_data(data, lang_cache = nil)
        return unless data

        output = {}
        restart = Proc.new do
          output.clear
        end
        check_lang = Proc.new do |key|
          lang_cache.has_key?(key)
        end if lang_cache

        data.each do |name, dataset|
          if name == 'likely_subtags'
            new_group = [{}, 0]
            new_lang_group = Proc.new do |group|
              group[0].clear
              group[1] = 0
            end
            new_entry = Proc.new do |group, key, value, last_lang, _|
              index = group[0].length
              group[0][key] = value
              group[1] |= if last_lang.nil?
                1 << LANG
              elsif key.length == last_lang.length + 5
                1 << CODA_LEN + index | 1 << SCRIPT
              else
                1 << COUNTRY
              end
            end
            commit_lang = Proc.new do |lang, (source_entries, meta)|
              output[lang] = [source_entries.values, meta]
            end
            process_output = Proc.new do |lang, (e, m)|
              if lang_cache.has_key?(lang) && !e.empty?
                llcache = lang_cache[lang]
                llcache[LANG_LIKELY_SUBTAGS] = e
                llcache[LANG_LIKELY] = m
                llcache[LANG_RESOLVER] = 1
                puts "post_process_locales_data: dataset='#{name}', lang=#{lang}, e=#{e}, m=#{m}, LANG_LIKELY_SUBTAGS=#{llcache[LANG_LIKELY_SUBTAGS]}, LANG_LIKELY=#{llcache[LANG_LIKELY].to_s(2)} (#{llcache[LANG_LIKELY]}), llcache=#{llcache}" if debug
              end
            end
          elsif name == 'language_aliases'
            new_group = {}
            new_lang_group = Proc.new do |group|
              group.clear
            end
            new_entry = Proc.new do |group, key, value, _, _|
              group[key] = value
            end
            to_array = Proc.new do |v|
              v.split(',')
            end
            commit_lang = Proc.new do |lang, group|
              output[lang] = group.transform_values(&to_array)
            end
            process_output = Proc.new do |lang, group|
              if lang_cache.has_key?(lang) && !group.empty?
                llcache = lang_cache[lang]
                llcache[LANG_SUBTAG_ALIASES] = group
                puts "post_process_locales_data: dataset='#{name}', lang=#{lang}, group=#{group}, LANG_SUBTAG_ALIASES=#{llcache[LANG_SUBTAG_ALIASES]}, llcache=#{llcache}" if debug
              end
            end
          else
            next
          end

          skipped = group_by_lang(dataset, new_lang_group, new_group, new_entry, commit_lang, restart, check_lang)
          output.each(&process_output) unless output.empty? || lang_cache&.empty?
          dataset.reject! do |k, _|
            skipped.has_key?(k)
          end unless skipped&.empty?
        end

        data
      end

      class UnsortedError < StandardError; end
      def self.group_by_lang(subtags, new_lang_group, new_group, new_entry, commit_lang, restart, check_lang = nil)
        dataset = subtags
        last_index = dataset.length - 1
        skipped = check_lang ? {} : nil
        begin
          restart.call
          skipped&.clear
          last_lang = nil
          skip_lang = false
          group = new_group.respond_to?(:call) ? new_group.call : new_group

          bsize = SEPARATORS_SORTED.bytesize
          dataset.each_with_index do |(key, value), index|
            i = 0
            len = key.bytesize
            sep = while i < len
              byte = key.getbyte(i)
              j = 0
              break i if while j < bsize
                s = SEPARATORS_SORTED.getbyte(j)
                break s == byte if s >= byte
                j = j.succ
              end == true
              i = i.succ
            end || len
            new_lang = sep == len
            raise "Unexpected language: key=#{key}, last_lang=#{last_lang}" unless (last_lang.nil? || !key.start_with?(last_lang) || last_lang.length != sep) == new_lang
            if new_lang
              commit_lang.call(last_lang, group) if last_lang && !skip_lang
              raise UnsortedError if last_lang && key.casecmp(last_lang) < 0
              last_lang = key
              new_lang_group.call(group)
              if key == 'und' || check_lang && !check_lang.call(key)
                skip_lang = true
                puts "group_by_lang: Skipping lang=#{key} at index=#{index} et seq" if debug
                skipped[key] = value
                next
              else
                skip_lang = false
              end
              new_entry.call(group, key, value, nil, index)
            else
              if skip_lang
                skipped[key] = value
                next
              end
              new_entry.call(group, key, value, last_lang, index)
            end
            commit_lang.call(last_lang, group) if index == last_index && last_lang
          end
        rescue UnsortedError
          puts "group_by_lang: Retrying with sorted dataset, length=#{dataset.length}"
          dataset = subtags.sort
          retry
        end
        skipped
      end
    end
  end

  class LocaleChooser
    module Constants
      PARSED = 0
      LANG_BLOOM = 1
      LANG_CACHE = 2
      LIKELY = 3
      LIKELY_SUBTAGS = 4
      LANG_ALIAS = 5
      LOCALE_CACHE_LEN = 6

      LANG_SUBTAG = 0
      LANG_SUBTAG_ALIASES = 1
      LANG_LIKELY = 2
      LANG_LIKELY_SUBTAGS = 3
      LANG_RESOLVER = 4
      LANG_CACHE_LEN = 5

      ORD_0 = '0'.ord
      ORD_9 = '9'.ord
      ORD_A_UC = 'A'.ord
      ORD_Z_UC = 'Z'.ord
      ORD_A_LC = 'a'.ord
      ORD_R_LC = 'r'.ord
      ORD_Z_LC = 'z'.ord

      SEPARATORS_SORTED = '-@_'
      SEPARATOR_STANDARD_POS = 0
      SEPARATOR_TERMINAL_POS = 1
      LANG = 0
      SCRIPT = 1
      COUNTRY = 2
      CODA_LEN = 4

      LANG_MASK = 1 << LANG
      SCRIPT_MASK = 1 << SCRIPT
      COUNTRY_MASK = 1 << COUNTRY
      SCRIPT_COUNTRY_MASK = SCRIPT_MASK | COUNTRY_MASK
      CODA_LEN_MASK = (1 << CODA_LEN) - 1

      COMPACT_BLOOM = 0
      META_OFFSET = CODA_LEN
      THREE_CHAR_COUNTRY = 0 + META_OFFSET
      THREE_CHAR_LANG = 1 + META_OFFSET
      NON_STD_SEP = 2 + META_OFFSET
      TRAILERS = 3 + META_OFFSET

      NON_STD_CASING_OFFSET = 4 + META_OFFSET
      NON_STD_CASING_LANG = LANG + NON_STD_CASING_OFFSET
      NON_STD_CASING_SCRIPT = SCRIPT + NON_STD_CASING_OFFSET
      NON_STD_CASING_COUNTRY = COUNTRY + NON_STD_CASING_OFFSET
      STANDARD_LENGTH = 7 + META_OFFSET
      META_LEN = 8
      BLOOM_LEN = ORD_Z_LC - ORD_A_LC + 2

      COMPACT_BLOOM_MASK = 1 << COMPACT_BLOOM
      THREE_CHAR_COUNTRY_MASK = 1 << THREE_CHAR_COUNTRY
      THREE_CHAR_LANG_MASK = 1 << THREE_CHAR_LANG
      NON_STD_SEP_MASK = 1 << NON_STD_SEP
      TRAILERS_MASK = 1 << TRAILERS

      NON_STD_CASING_LANG_MASK = 1 << NON_STD_CASING_LANG
      STANDARD_LENGTH_MASK = 1 << STANDARD_LENGTH

      NON_STD_CASING_MASK = NON_STD_CASING_LANG_MASK | 1 << NON_STD_CASING_SCRIPT | 1 << NON_STD_CASING_COUNTRY
      STANDARD_MASK = NON_STD_SEP_MASK | TRAILERS_MASK | NON_STD_CASING_MASK | STANDARD_LENGTH_MASK

      STANDARD_CASING_LANG = 0
      STANDARD_CASING_SCRIPT = 1
      STANDARD_CASING_COUNTRY = ~0

      GET_COMPACT_BLOOM = -1
      GET_TWO_CHAR_BLOOM = -2

      MATCH_MASK = 1 << 0
      DESIRED_MASK = 1 << 1
      AVAILABLE_MASK = 1 << 2

      NEGATIVE_HIT = MATCH_MASK
      AVAILABLE_EMPTY = DESIRED_MASK
      DESIRED_EMPTY = AVAILABLE_MASK
      AVAILABLE_FIRST = DESIRED_MASK | MATCH_MASK
      DESIRED_FIRST = AVAILABLE_MASK | MATCH_MASK
      POSITIVE_HIT = AVAILABLE_MASK | DESIRED_MASK | MATCH_MASK
      MISMATCH = AVAILABLE_MASK | DESIRED_MASK
    end
    include Constants

    @@debug = false

    def self.debug(special = false)
      @@debug
    end

    def self.load_locales_data(bloom = nil, config = nil)

      resolver = config&.dig('resolver') || 'CacheLookup'
      @resolver = setup_resolver(resolver, config)
      puts "load_locales_data: Set up resolver '#{resolver}': #{@resolver}" if debug

      data = nil

      v = Proc.new do |w|
        unless data && data['likely_subtags']
          begin
            data_source = FDroid::LocaleDataSource&.const_get(w)
            raise "Unknown likely subtags data source '#{w}' ignored: #{data_source}" unless data_source&.is_a?(Class)
            data = data_source.load_data(bloom, config)
            puts "Acquired locales data from data source '#{w}'"
          rescue => e
            puts "Failed to acquire likely subtags from data source '#{w}': #{e.class} - #{e.message}.  Trying next source."
          end
        end
      end

      c = Proc.new do |s|
        v.call(s)
        data && data['likely_subtags']
      end

      sources = config&.dig('likely_subtags_data_source') || 'Python3Babel'
      sources.is_a?(String) && c.call(sources) || sources.is_a?(Array) && sources.any?(&c)

      if data
        @resolver&.post_process_locales_data(data, @lang_cache)
        data.is_a?(Hash) ? data.each do |s, d|
          puts "  '#{s}':"
          d.is_a?(Hash) ? d.each do |k, v|
            puts "    '#{k}' => '#{v}'"
          end : puts("    '#{d}'") if d
        end : puts("  '#{data}'") if data
      else
        raise "load_locales_data: No available source found to populate likely subtags dataset"
      end
    end

    def self.setup_resolver(r, config = nil)
      begin
        resolver = FDroid::Resolver&.const_get(r)
        raise "Unknown resolver '#{r}': #{resolver}" unless resolver&.is_a?(Class)
        resolver.class_eval do
          include FDroid::LocaleChooser::Constants
          def self.debug(special = false)
            FDroid::LocaleChooser.debug(special)
          end unless respond_to?(:debug)
        end
        resolver.method(:setup).call(config) if resolver.respond_to?(:setup)
      rescue => e
        puts "Failed to setup resolver '#{r}': #{e.class} - #{e.message}"
      end
      puts "setup_resolver: #{r}, resolver=#{resolver}" if debug
      resolver
    end

    def self.init_prefilter(locales, locale_cache, for_aliases = false, fallback_locale = nil)
      
      len = 2 * BLOOM_LEN + CODA_LEN
      mask = (1 << len) - 1

      composite = 0

      compact_len = BLOOM_LEN + CODA_LEN
      compact_mask = (1 << compact_len) - 1

      compute_lang_bloom = Proc.new do |locale|
        parsed = parse_locale(locale, GET_TWO_CHAR_BLOOM)
        puts "preload: parsed lang_bloom for '#{locale}': #{parsed.to_s(2).rjust(len, '0')} (#{parsed})" if debug
        
        bloom = parsed & mask
        composite |= bloom

        bloom & compact_mask | (bloom & ~compact_mask) >> BLOOM_LEN | COMPACT_BLOOM_MASK
      end

      if fallback_locale && (fallback = locales.index(fallback_locale))
        fallback_bloom = nil
      end
      i = fallback ? -1 : 0
      len = locales.length
      while i < len
        locale = locales[i < 0 ? fallback : i]
        lang_bloom = compute_lang_bloom.call(locale) unless for_aliases || i == fallback
        if i != fallback && (lcache = locale_cache[locale])
          if !for_aliases
            lcache[LANG_BLOOM] = lang_bloom
            puts "preload: Added compact bloom to @locale_cache for '#{locale}': #{lang_bloom.to_s(2).rjust(compact_len, '0')} (#{lang_bloom})" if debug
          elsif aliases = lcache[LANG_ALIAS]
            j = 0
            a_len = aliases.length
            while j < a_len
              lcache[LANG_BLOOM] |= compute_lang_bloom.call(aliases[j])
              j = j.succ
            end
          end
          if i < 0
            fallback_bloom = lcache[LANG_BLOOM]
          elsif fallback_bloom
            lcache[LANG_BLOOM] |= fallback_bloom
          end
        end
        i = i.succ
      end

      composite
    end

    def self.preload(locales, config = nil)
      puts "Preloading for locales #{locales}" if debug

      @locale_cache ||= {}
      @lang_cache ||= {}

      locales |= ['en_US', FALLBACK_LOCALE]
      i = 0
      locales_len = locales.length
      while i < locales_len
        locale = locales[i]

        unless @locale_cache.has_key?(locale)
          lcache = @locale_cache[locale] ||= Array.new(LOCALE_CACHE_LEN)

          parsed = lcache[PARSED] = parse_locale(locale)
          lang = get_part(parsed, LANG, locale, true)
          lang.downcase! if parsed & NON_STD_CASING_LANG_MASK != 0

          if @lang_cache.has_key?(lang)
            lcache[LANG_CACHE] = @lang_cache[lang]
          else
            llcache = lcache[LANG_CACHE] = @lang_cache[lang] = Array.new(LANG_CACHE_LEN)
            llcache[LANG_SUBTAG] = lang
          end
        end
        i = i.succ
      end

      composite = init_prefilter(locales, @locale_cache)
      puts "preload: Computed composite bloom for '#{locales}': #{composite.to_s(2).rjust(len, '0')} (#{composite})" if debug
      
      load_locales_data composite, config

      i = 0
      while i < locales_len
        locale = locales[i]
        lcache = @locale_cache[locale]

        parsed = lcache[PARSED]
        likely_subtags = get_likely_subtags(parsed, locale, nil, lcache[LANG_CACHE], lcache[LANG_CACHE][LANG_SUBTAG])
        puts "post_process_locale: get_likely_subtags for '#{locale}': '#{likely_subtags}', lcache[LANG_CACHE]=#{lcache[LANG_CACHE]}, lcache[LANG_CACHE][LANG_SUBTAG]=#{lcache[LANG_CACHE][LANG_SUBTAG]}, lcache=#{lcache}" if debug
        if likely_subtags
          lcache[LIKELY_SUBTAGS] = likely_subtags
          likely = lcache[LIKELY] = parse_locale(likely_subtags)
        end
        if (llcache = lcache[LANG_CACHE]) && (legacy_langs = llcache[LANG_SUBTAG_ALIASES])
          aliases = nil
          legacy_langs.each do |k, v|
            (aliases ||= []).concat(v) if (k_len = k.bytesize) == (l_len = llcache[LANG_SUBTAG].bytesize) || if k_len == l_len + 5
              mask = 0b1111 << l_len + 1
              compare_part?(mask, parsed & SCRIPT_MASK != 0 ? locale : likely_subtags, mask, k)
            else
              k_parsed = parse_locale(k)
              if k_parsed & COUNTRY_MASK != 0
                supplied = parsed & COUNTRY_MASK != 0
                compare_component(supplied ? parsed : likely, supplied ? locale : likely_subtags, k_parsed, k, COUNTRY) == POSITIVE_HIT
              else
                true
              end && matches_language_and_script(parsed, locale, k_parsed, k, likely, likely_subtags, lcache, llcache[LANG_SUBTAG])
            end
          end
          if aliases && !aliases.empty?
            aliases.sort!
            lcache[LANG_ALIAS] = aliases
          end
        end
        i = i.succ
      end

      init_prefilter(locales, @locale_cache, true, FALLBACK_LOCALE)
      @fallback_cache = @locale_cache[FALLBACK_LOCALE]

      puts "preload: Generated @locale_cache #{@locale_cache}, @fallback_cache = #{@fallback_cache}" if debug

      @resolver.method(:cleanup).call if @resolver&.respond_to?(:cleanup)
    end

    def self.separator_or_bloom_bit_pos(byte, parse_casing = false)
      uppercase = 0 if parse_casing
      char = if byte < ORD_A_UC || byte > ORD_Z_UC
        byte
      else
        uppercase = 1 if parse_casing
        byte ^ 32
      end
      if parse_casing && char >= ORD_0 && char <= ORD_9
        1
      elsif char < ORD_A_LC || char > ORD_Z_LC
        i = 0
        bsize = SEPARATORS_SORTED.bytesize
        while i < bsize
          sep = SEPARATORS_SORTED.getbyte(i)
          break sep == byte ? ~i : 0 if sep >= byte
          i = i.succ
        end || 0
      else
        pos = char - ORD_A_LC + 1
        parse_casing ? pos << 1 | uppercase : pos
      end
    end

    def self.parse_locale(locale, lang_bloom = nil, eol = nil)
      return nil unless locale && !locale.empty?
      lang_bloom ||= 0

      last_sep = -1
      parts = 0
      parsed = 0
      bloom = lang_bloom == 0 ? 0 : if lang_bloom > 0
        lang_bloom & COMPACT_BLOOM_MASK != 0 ? 1 : 2
      elsif lang_bloom == GET_COMPACT_BLOOM
        parsed |= COMPACT_BLOOM_MASK
        1
      else
        2
      end
      pad_len = (lang_bloom < 0 ? bloom * BLOOM_LEN : META_LEN) + CODA_LEN
      parse_meta = lang_bloom >= 0
      if parse_meta
        casing = 0
        std_len = 0
      end

      last_pos = locale.bytesize
      index = 0
      while index <= last_pos
        is_last = index == last_pos || eol && locale.getbyte(index) == eol ? 1 : 0
        is_sep = separator_or_bloom_bit_pos(locale.getbyte(index), parse_meta) unless is_last.odd?

        if is_last.odd? || (is_sep < 0) != parts.odd?
          unless parts.odd?
            part_len = index - last_sep - 1
            component =
              if parts == 0
                if lang_bloom < 0
                  is_last |= 2
                elsif lang_bloom > 0 && lang_bloom & 1 << (part_len > 2 ? 3 : part_len) == 0
                  parsed = ~parsed
                  is_last |= 2
                end
                if parse_meta
                  if part_len == 3
                    parsed |= THREE_CHAR_LANG_MASK
                    std_len |= LANG_MASK
                  elsif part_len == 2
                    std_len |= LANG_MASK
                  end
                end
                LANG
              elsif part_len == 4
                std_len |= SCRIPT_MASK if parse_meta
                SCRIPT
              else
                is_last |= 2
                if part_len == 3 && locale.getbyte(last_sep + 1) == ORD_R_LC
                  last_sep = last_sep.succ
                  part_len = part_len.pred
                  parsed |= 1 << pad_len + last_sep
                  parsed |= NON_STD_SEP_MASK if parse_meta
                  puts "parse_locale: Android country separator '-r' encountered while parsing '#{locale}' with lang_bloom #{lang_bloom&.to_s(2)}, interpreting country as '#{locale[last_sep + 1, part_len]}': parts=#{parts}, index=#{index}, last_pos=#{last_pos}, last_sep=#{last_sep}, part_len=#{part_len}" if debug true
                end
                if parse_meta
                  if part_len == 3
                    parsed |= THREE_CHAR_COUNTRY_MASK
                    std_len |= COUNTRY_MASK
                  elsif part_len == 2
                    std_len |= COUNTRY_MASK
                  end
                end
                COUNTRY
              end
            if lang_bloom < 0
              parsed |= 1 << (part_len > 2 ? 3 : part_len)
            else
              parsed |= 1 << component
              part_casing = casing >> last_sep + 1
              parsed |= 1 << NON_STD_CASING_OFFSET + component unless component == LANG && part_casing == STANDARD_CASING_LANG || component == SCRIPT && part_casing == STANDARD_CASING_SCRIPT || component == COUNTRY && part_casing == STANDARD_CASING_COUNTRY & ((1 << part_len) - 1)
            end
          end
          parts = parts.succ
        end

        if is_last.even?
          casing |= (is_sep & 1) << index if parse_meta && is_sep > 0
          if is_sep < 0
            parsed |= 1 << pad_len + index
            last_sep = index
            parsed |= NON_STD_SEP_MASK if parse_meta && ~is_sep != SEPARATOR_STANDARD_POS
            is_last |= 2 if ~is_sep == SEPARATOR_TERMINAL_POS
          elsif lang_bloom != 0 && parts == 0
            if index < 2
              bit_pos = (parse_meta ? is_sep >> 1 : is_sep) + (bloom == 1 || index < 1 ? 0 : BLOOM_LEN) + CODA_LEN
              if lang_bloom < 0
                parsed |= 1 << bit_pos
              elsif lang_bloom & 1 << bit_pos == 0
                parsed = ~parsed
                is_last |= 2
              end
            elsif lang_bloom > 0 && lang_bloom & 1 << 3 == 0
              parsed = ~parsed
              is_last |= 2
            end
          end
        end

        break if is_last >= 1
        index = index.succ
      end
      if parse_meta && parsed >= 0
        parsed |= TRAILERS_MASK unless index == last_pos
        parsed |= STANDARD_LENGTH_MASK if std_len == parsed & CODA_LEN_MASK
      end

      puts(if parsed < 0
        "parse_locale: Parsed '#{locale}' with lang_bloom #{lang_bloom&.to_s(2)} and rejected at #{(~parsed).to_s(2).rjust(last_pos + pad_len, '0')} (#{~parsed}), parts=#{parts}, index=#{index}, last_pos=#{last_pos}, last_sep=#{last_sep}\n  Returning #{parsed}"
      elsif lang_bloom < 0
        "parse_locale: Parsed '#{locale}' to generate lang_bloom#{lang_bloom} as #{parsed.to_s(2).rjust(last_pos + pad_len, '0')} (#{parsed}), parts=#{parts}, index=#{index}, last_pos=#{last_pos}, last_sep=#{last_sep}\n  Returning #{parsed}"
      else
        "parse_locale: Parsed '#{locale}' with lang_bloom #{lang_bloom&.to_s(2)} as #{parsed.to_s(2).rjust(last_pos + pad_len, '0')} (#{parsed}), parts=#{parts}, index=#{index}, last_pos=#{last_pos}, last_sep=#{last_sep}, casing=#{casing.to_s(2)}, std_len=#{std_len.to_s(2)}"
      end) if debug parsed >= 0 && parsed & TRAILERS_MASK != 0
      parsed
    end

    def self.has_part(locale, component, safe = true)
      return nil unless safe || (component >= 0 && component < CODA_LEN)

      locale & 1 << component != 0
    end

    @@get_part_cache = {}

    def self.get_part(locale, component, locale_string, as_string = nil, offset = nil, length = nil, safe = true)
      return nil unless safe || (component >= 0 && component < CODA_LEN && locale & 1 << component != 0 && locale_string)
      return locale_string if as_string == true && locale & CODA_LEN_MASK == 1 << component

      len = locale_string.bytesize
      return get_part_do(locale, component, locale_string, as_string, offset, length) if as_string || len >= 16
      key = locale >> META_LEN + CODA_LEN << CODA_LEN * 2 + 4 | (locale & CODA_LEN_MASK) << CODA_LEN + 4 | component << 4 | len
      puts("get_part: caching for locale=#{locale&.to_s(2)}, component=#{component}, len=#{len}, as_string=#{as_string}: locale_string=#{locale_string}, key=#{key.to_s(2)} (#{key})") if debug && !@@get_part_cache.has_key?(key)
      @@get_part_cache[key] ||= get_part_do(locale, component, locale_string)
    end

    def self.get_part_do(locale, component, locale_string, as_string = nil, offset = nil, length = nil)
      part =
        if component != COUNTRY || has_part(locale, SCRIPT)
          component
        else
          component - 1
        end
      start_part = part << 1
      end_part = start_part + 1

      start_pos = 0
      end_pos = locale_string.bytesize

      parts = 0
      last_sep = -1
      parsed = locale >> META_LEN + CODA_LEN
      until parsed.zero?
        next_bit = parsed & -parsed
        last_sep = next_bit.bit_length - 1
        parsed = ~parsed & ~(next_bit - 1)
        parts = parts.succ
        if parts == start_part
          start_pos = last_sep
        elsif parts == end_part
          end_pos = last_sep
        end
        break if parts >= end_part
      end
      s = if as_string
        if as_string.is_a?(String)
          as_string.bytesplice(offset || 0, length || as_string.bytesize, locale_string, start_pos, end_pos - start_pos)
        else
          locale_string&.byteslice(start_pos, end_pos - start_pos)
        end
      else
        ~(locale >> META_LEN + CODA_LEN) & ((1 << end_pos) - 1) & ~((1 << start_pos) - 1)
      end
      puts "get_part: Component #{component} of #{locale&.to_s(2)} (#{locale}) for '#{locale_string}' [#{start_pos}...#{end_pos}] returned as #{s.class.name}: #{s.is_a?(Integer) ? s.to_s(2) : s.to_s}, parts=#{parts}, as_string=#{as_string} (#{s&.equal?(as_string)}), offset=#{offset}, length=#{length}" if debug as_string&.is_a?(String) && !as_string.equal?(s)
      s
    end

    def self.to_lower_case(char)
      char < ORD_A_UC || char > ORD_Z_UC ? char : char ^ 32
    end

    def self.compare_bytechar(desired_locale, pos_d, available_locale, pos_a)
      char_d = desired_locale.getbyte(pos_d)
      char_a = available_locale.getbyte(pos_a)

      char_d == char_a ? 0 : to_lower_case(char_d) <=> to_lower_case(char_a)
    end

    def self.compare_bytechar?(desired_locale, pos_d, available_locale, pos_a)
      compare_bytechar(desired_locale, pos_d, available_locale, pos_a) == 0
    end

    def self.compare_part(desired, desired_locale, available, available_locale, safe = true)
      return nil unless safe || (desired > 0 && available > 0)
      # fast path for object identity check
      return 0 if desired_locale.equal?(available_locale) && desired == available

      pos_d = (desired & -desired).bit_length - 1
      pos_a = (available & -available).bit_length - 1
      # force evaluation on both sides with bitwise OR (|) for value assignments
      until (eod = (desired & ~0 << pos_d).zero?) | (eoa = (available & ~0 << pos_a).zero?)
        while (desired & 1 << pos_d).zero?
          pos_d = pos_d.succ
        end
        while (available & 1 << pos_a).zero?
          pos_a = pos_a.succ
        end
        r = compare_bytechar(desired_locale, pos_d, available_locale, pos_a)
        puts "compare_part: Compared '#{desired_locale}' [#{desired.to_s(2)}] with '#{available_locale}' [#{available.to_s(2)}]: compare_bytechar = #{r} @ pos_d=#{pos_d} pos_a=#{pos_a}" unless r == 0 || !debug
        return r unless r == 0
        pos_d = pos_d.succ
        pos_a = pos_a.succ
      end
      puts "compare_part: Compared '#{desired_locale}' [#{desired.to_s(2)}] with '#{available_locale}' [#{available.to_s(2)}]: eod=#{eod} && eoa=#{eoa}" if debug
      eod && eoa ? 0 : (eod ? -2 : 2)
    end

    def self.compare_part?(desired, desired_locale, available, available_locale, safe = true)
      compare_part(desired, desired_locale, available, available_locale, safe) == 0
    end

    def self.compare_component(desired, desired_locale, available, available_locale, component, for_sorting = false)
      mask = 1 << component
      same = (desired ^ available) & mask == 0

      return same ? NEGATIVE_HIT : DESIRED_EMPTY if desired & mask == 0
      
      return AVAILABLE_EMPTY unless same

      return desired_locale == available_locale ? POSITIVE_HIT : MISMATCH if desired_locale.bytesize == available_locale.bytesize && desired & SCRIPT_COUNTRY_MASK == available & SCRIPT_COUNTRY_MASK && desired & STANDARD_MASK == STANDARD_LENGTH_MASK && available & STANDARD_MASK == STANDARD_LENGTH_MASK

      r = compare_part(get_part(desired, component, desired_locale), desired_locale, get_part(available, component, available_locale), available_locale)
      if r == 0
        POSITIVE_HIT
      elsif for_sorting
        r < 0 ? DESIRED_FIRST : AVAILABLE_FIRST
      else
        MISMATCH
      end
    end

    def self.get_likely_subtags(locale, locale_string, query_mask = nil, lang_cache = nil, lang = nil, script = nil, country = nil)
      mask = SCRIPT_COUNTRY_MASK
      has_specifics = locale & mask
      has_specifics &= query_mask if query_mask
      return nil if has_specifics == mask

      resolver = @resolver.init(lang_cache, lang)
      return nil unless resolver

      if (lang_likely_subtags = @resolver.get_likely_subtags_for_lang(resolver, locale, locale_string, query_mask, lang_cache, lang))
        lang_likely = @resolver.parse_locale(resolver, lang_likely_subtags, lang_cache)
        if has_specifics != 0
          part = has_specifics & SCRIPT_MASK != 0 ? SCRIPT : COUNTRY
          part_matches = compare_component(lang_likely, lang_likely_subtags, locale, locale_string, part) == POSITIVE_HIT
          unless part_matches
            part_string = part == SCRIPT ? script : country
            part_likely_subtags = @resolver.get_likely_subtags_for_lang_part(resolver, locale, locale_string, query_mask, lang_cache, part, lang, part_string)
            puts "get_likely_subtags: For '#{locale_string}' [#{locale&.to_s(2)}] by lang-part#{part}: '#{part_likely_subtags}', part_string=#{part_string}" if debug
            return part_likely_subtags if part_likely_subtags || part == SCRIPT
          end
        end
        puts "get_likely_subtags: For '#{locale_string}' [#{locale&.to_s(2)}] by lang='#{lang}': '#{lang_likely_subtags}' [#{lang_likely&.to_s(2)}]" if debug
        return lang_likely_subtags
      end
      puts "get_likely_subtags: Nil found for '#{locale_string}' [#{locale&.to_s(2)}] by lang=#{lang}" if debug
      nil
    end

    def self.matches_language_and_script(desired, desired_locale, available, available_locale, desired_likely = nil, desired_likely_subtags = nil, desired_lang_cache = nil, desired_lang = nil, matched_lang = nil, available_likely = nil, available_likely_subtags = nil)
      if desired_lang
        i = 0
        sep = desired_lang.bytesize
        len_cmp = available_locale.bytesize <=> sep
        return false unless (available & CODA_LEN_MASK == LANG_MASK ? len_cmp == 0 : len_cmp > 0 && available & 1 << META_LEN + CODA_LEN + sep != 0) && (available & NON_STD_CASING_LANG_MASK == 0 ? (len_cmp == 0 ? available_locale == desired_lang : available_locale.start_with?(desired_lang)) : while i < sep
          break false unless compare_bytechar?(desired_lang, i, available_locale, i)
          i = i.succ
        end.nil?)
      else
        lang_d = get_part(desired, LANG, desired_locale)
        lang_a = get_part(available, LANG, available_locale)
        return false unless compare_part?(lang_d, desired_locale, lang_a, available_locale)
      end unless matched_lang == true
      return true if (desired | available) & SCRIPT_COUNTRY_MASK == 0 || desired & SCRIPT_COUNTRY_MASK == COUNTRY_MASK && available & SCRIPT_COUNTRY_MASK == COUNTRY_MASK && compare_part?(get_part(desired, COUNTRY, desired_locale), desired_locale, get_part(available, COUNTRY, available_locale), available_locale)
      if has_part(desired, SCRIPT)
        script_dl = desired_locale
        script_d = get_part(desired, SCRIPT, script_dl)
      else
        script_dl = desired_likely_subtags
        script_d = get_part(desired_likely, SCRIPT, script_dl) if script_dl
      end
      if has_part(available, SCRIPT)
        script_al = available_locale
        script_a = get_part(available, SCRIPT, script_al)
      else
        script_al = available_likely_subtags ||= get_likely_subtags(available, available_locale, nil, desired_lang_cache, desired_lang)
        script_a = get_part(available_likely ||= available_likely_subtags ? parse_locale(available_likely_subtags) : nil, SCRIPT, script_al) if script_al
      end
      puts "matches_language_and_script: available '#{available_locale}' [#{available&.to_s(2)}] matches lang of desired '#{desired_locale}' [#{desired&.to_s(2)}].  Turning to script: script_dl='#{script_dl}' [#{script_d&.to_s(2)}], script_al='#{script_al}' [#{script_a&.to_s(2)}], desired_lang=#{desired_lang}, desired_lang_cache=#{desired_lang_cache}, matched_lang=#{matched_lang}" if debug
      if script_dl && script_al
        return false unless compare_part?(script_d, script_dl, script_a, script_al)
      end
      true
    end

    FALLBACK_LOCALE = 'en'
    FALLBACK = parse_locale(FALLBACK_LOCALE)

    def self.select_prio(available, available_locale, index, index_len, desired, desired_locale, desired_cache, weighting = true)
      puts "select_prio: Determining prio for '#{available_locale}' [#{available&.to_s(2)}] at #{index}: desired_locale='#{desired_locale}' [#{desired&.to_s(2)}]" if debug

      mask = SCRIPT_COUNTRY_MASK
      prio = 0
      legacy_lang = -1
      while prio <= 1
        if prio == 0
          d = desired
          dl = desired_locale
          dc = desired_cache
        else
          d = FALLBACK
          dl = FALLBACK_LOCALE
          dc = @fallback_cache
        end
        if d & mask != mask
          if dc
            desired_likely_subtags = dc[LIKELY_SUBTAGS]
            desired_likely = dc[LIKELY]
          else
            desired_likely_subtags = get_likely_subtags(d, dl)
            desired_likely = desired_likely_subtags ? parse_locale(desired_likely_subtags) : nil
          end
        end
        if matches_language_and_script(d, dl, available, available_locale, desired_likely, desired_likely_subtags, dlc = dc ? dc[LANG_CACHE] : nil, legacy_lang < 0 ? (dlc ? dlc[LANG_SUBTAG] : nil) : dc[LANG_ALIAS][legacy_lang])
          return index unless weighting
          preferred_country = 
            if !has_part(available, COUNTRY)
              AVAILABLE_EMPTY
            elsif has_part(d, COUNTRY)
              compare_component(d, dl, available, available_locale, COUNTRY)
            else
              compare_component(desired_likely, desired_likely_subtags, available, available_locale, COUNTRY)
            end == POSITIVE_HIT
          puts "select_prio: Matches '#{available_locale}' [#{available&.to_s(2)}] against lang prio #{prio}: d='#{dl}' [#{d&.to_s(2)}] desired_likely_subtags='#{desired_likely_subtags}' [#{desired_likely&.to_s(2)}] preferred_country=#{preferred_country}" if debug
          return compute_weight(available, available_locale, index, index_len, prio, d, dl, preferred_country)
        end
        legacy_lang = dc[LANG_ALIAS].length if legacy_lang < 0 && dc && dc[LANG_ALIAS]
        if legacy_lang > 0
          legacy_lang = legacy_lang.pred
          redo
        elsif legacy_lang == 0
          legacy_lang = -1
        end
        prio = prio.succ
      end
      ~0
    end

    def self.compute_weight(available, available_locale, index, index_len, lang_prio, desired, desired_locale, preferred_country)
      mask = SCRIPT_COUNTRY_MASK
      has_specifics = available & mask
      compare_country = compare_component(desired, desired_locale, available, available_locale, COUNTRY)
      match_specifics = has_specifics & desired != 0 && (compare_country == NEGATIVE_HIT || compare_country == POSITIVE_HIT)
      match_prio = match_specifics ? ~has_specifics & mask : has_specifics | 0b1000 | (preferred_country ? 0 : 1)
      std_sep = available >> NON_STD_SEP & 1
      trailers = available >> TRAILERS & 1

      w = lang_prio << CODA_LEN + index_len + 2 | trailers << CODA_LEN + index_len + 1 | match_prio << index_len + 1 | std_sep << index_len | index
      puts "compute_weight: available '#{available_locale}' [#{available&.to_s(2)}] weighted against desired '#{desired_locale}' [#{desired&.to_s(2)}]: #{w.to_s(2).rjust(1 + CODA_LEN + index_len, 'O')} (#{w})" if debug std_sep == 1
      puts "  lang_prio: #{lang_prio.to_s(2)} (#{lang_prio}) | trailers: #{trailers} | match_prio: #{match_prio.to_s(2).rjust(CODA_LEN, 'O')} (#{match_prio}) | std_sep: #{std_sep} | index: #{index.to_s(2).rjust(index_len, 'O')} (#{index})" if debug trailers == 1
      w
    end

    def self.available_locales(desired_locale, localized_data)
      desired_cache = @locale_cache[desired_locale] if @locale_cache
      lang_bloom = desired_cache[LANG_BLOOM] if desired_cache

      desired = (desired_cache ? desired_cache[PARSED] : nil) || parse_locale(desired_locale)

      locales = localized_data.keys
      locales_len = locales.length
      index_len = locales_len.bit_length

      shortlist = []
      index = 0
      solo = locales_len == 1
      while index < locales_len
        available_locale = locales[index]
        available = parse_locale(available_locale, lang_bloom)

        if available >= 0 && (weight = select_prio(available, available_locale, index, index_len, desired, desired_locale, desired_cache, !solo)) >= 0
          if solo
            puts "available_locales: Returning the matching single locale '#{available_locale}' from #{locales} for '#{desired_locale}'" if debug
            return shortlist << available_locale
          else
            puts "available_locales: Adding '#{available_locale}' at #{index} with weight #{weight.to_s(2)} (#{weight})" if debug
            shortlist << weight
          end
        end
        index = index.succ
      end
      shortlist_len = shortlist.length
      shortlist.sort! if shortlist_len > 1

      i = 0
      mask = (1 << index_len) - 1
      while i < shortlist_len
        shortlist[i] = locales[shortlist[i] & mask]
        i = i.succ
      end
      puts "available_locales: Got #{shortlist.length} out of #{locales.length} locales from #{locales} for '#{desired_locale}': \n  #{shortlist}" if debug
      shortlist
    end

    def self.compare_lang(locale, sep, l)
      (j = 0; while j < sep
        cmp = compare_bytechar(l, j, locale, j)
        break cmp unless cmp == 0
        j = j.succ
      end || 0) if (len_cmp = l.bytesize <=> sep; if len_cmp == 0
        true
      elsif len_cmp > 0
        bsize = SEPARATORS_SORTED.bytesize
        c = l.getbyte(sep)
        j = 0
        while j < bsize
          s = SEPARATORS_SORTED.getbyte(j)
          break s == c if s >= c
          j = j.succ
        end
      end) == true
    end

    def self.is_localized(locale, available_locales)
      return nil unless locale && available_locales
      return locale if locale == '_'

      desired_cache = @locale_cache[locale] if @locale_cache

      i = 0
      len = locale.bytesize
      bsize = SEPARATORS_SORTED.bytesize
      sep = while i < len
        byte = locale.getbyte(i)
        j = 0
        break i if while j < bsize
          s = SEPARATORS_SORTED.getbyte(j)
          break s == byte if s >= byte
          j = j.succ
        end == true
        i = i.succ
      end || len

      if desired_cache && (legacy = desired_cache[LANG_ALIAS])
        legacy_len = legacy.length
      end

      i = 0
      alen = available_locales.length
      r = while i < alen
        l = available_locales[i]
        j = 0
        break l if compare_lang(locale, sep, l) == 0 || legacy && while j < legacy_len
          ll = legacy[j]
          cmp = compare_lang(ll, ll.bytesize, l)
          break cmp if cmp && cmp <= 0
          j = j.succ
        end == 0
        i = i.succ
      end
      puts "is_localized: returns #{r.nil? ? 'nil' : r}, locale=#{locale}, available_locales=#{available_locales}, legacy=#{legacy}" if debug
      r
    end
  end
end

Jekyll::Hooks.register :site, :after_init do |site|
  enabled = site.config.dig('locale_chooser', 'enabled') || true
  enforced = enabled&.is_a?(String) && enabled.match?(/(?:always|(?:en)?forced?)/i)
  if enabled
    begin
      Jekyll::logger.info 'LocaleChooser:', "Preparing for site languages #{site.config['languages']}"
      FDroid::LocaleChooser.preload site.config['languages'], site.config['locale_chooser']

      if defined?(FDroid::Utils)
        FDroid::Utils
      else
        FDroid::Package
      end.singleton_class.class_eval do
        alias available_locales_orig available_locales
        def available_locales(desired_locale, localized_data)
          FDroid::LocaleChooser.available_locales(desired_locale, localized_data)
        end
      end

      FDroid::Package.singleton_class.class_eval do
        alias is_localized_orig is_localized
        def is_localized(locale, available_locales)
          FDroid::LocaleChooser.is_localized(locale, available_locales)
        end
      end
      puts "Using LocaleChooser backed by likely subtags dataset in place of jekyll-fdroid implementation"
    rescue => e
      Jekyll::logger.warn 'LocaleChooser:', "Failed to bootstrap with likely subtags dataset: #{e.class} - #{e.message}.  Falling back to existing jekyll-fdroid implementation."
      raise if enforced || FDroid::LocaleChooser.debug
    end
  end
end

#
# For debugging only
#
# DEBUG_LANGS = ['zh_Hant']
# DEBUG_FUNCS = ['available_locales', 'compute_weight', 'matches_language_and_script']
# DEBUG_FUNCS_CALLED_BY = ['available_locales']
# DEBUG_FUNCS = ['available_locales']

Jekyll::Hooks.register :site, :post_read do |site|
  FDroid::LocaleChooser.singleton_class.class_eval do
    class_variable_set(:@@debug, true)
    Jekyll::logger.info 'LocaleChooser:', "Enabled debugging for site.active_lang=#{site.active_lang}"

    if (defined?(DEBUG_FUNCS) && DEBUG_FUNCS.any?) || (defined?(DEBUG_FUNCS_CALLED_BY) && DEBUG_FUNCS_CALLED_BY.any?)
      if defined?(DEBUG_FUNCS_CALLED_BY) && DEBUG_FUNCS_CALLED_BY.any?
        FDroid::LocaleChooser.const_set(:FILTER_CALL_BY, Proc.new do |c|
          c.label.end_with?(*DEBUG_FUNCS_CALLED_BY)
        end)
      end

      FDroid::LocaleChooser.const_set(:FILTER_CALLERS, Proc.new do |callers|
        (defined?(DEBUG_FUNCS) && callers[0].label.end_with?(*DEBUG_FUNCS)) || (FDroid::LocaleChooser.const_defined?(:FILTER_CALL_BY) && callers.any?(&FDroid::LocaleChooser.const_get(:FILTER_CALL_BY)))
      end)

      alias debug_orig debug
      def debug(special = false)
        special || debug_orig(special) && caller_locations(1, const_defined?(:FILTER_CALL_BY) ? 2 : 1)&.yield_self(&const_get(:FILTER_CALLERS))
      end
    end
  end if DEBUG_LANGS.include?(site.active_lang)
end if defined?(DEBUG_LANGS) && DEBUG_LANGS.any?
