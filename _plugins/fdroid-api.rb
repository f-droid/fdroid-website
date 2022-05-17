require 'fileutils'
require 'json'

module Jekyll
  class JsonApiGenerator < Generator
    def generate(site)
      return if site.active_lang != site.default_lang
      dir = File.join(site.dest, 'api', 'v1', 'packages')
      FileUtils.mkdir_p(dir)
      site.pages.each do |page|
        if page.data && page.data.key?('package_name')
          # TODO temporary hack to stop https://gitlab.com/fdroid/fdroid-website/-/issues/517
          next if /\.(coffee|css|html|js|md)$/ =~ page.data['package_name']
          site.pages << JsonApi.new(site, dir, page.data)
        end
      end
    end
  end

  class JsonApi < Page
    def initialize(site, dir, data)
      name = data['package_name']
      json = {
        'packageName' => data['package_name'],
        'suggestedVersionCode' => data['suggested_version_code'],
        'packages' => data.fetch('versions', []).map do |versions|
          {
            'versionName' => versions['version_name'],
            'versionCode' => versions['version_code']
          }
        end
      }
      File.open(File.join(dir, name), 'w') do |file|
        file.write(json.to_json)
      end
      super(site, site.source, dir, name)
    end
  end
end
