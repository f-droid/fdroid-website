require 'json'

module Jekyll
  class JsonApiGenerator < Generator
    attr_accessor :alreadyBuilt

    def generate(site)
      return if site.active_lang != site.default_lang

      # generator will only run on first build, not because of auto-regeneration
      if @alreadyBuilt != true
        @alreadyBuilt = true

        pages = site.collections["packages"]&.docs
        if pages && !pages.empty?
          pages.each do |page|
            site.pages << PackageJson.new(site, site.source, page.data)
          end
        end
      end
    end
  end

  class JsonApi < Page
    def initialize(site, base, json = nil)
      @site = site
      @base = base

      self.ext = ''
      self.basename = name
      self.content = json&.to_json
      self.data ||= {}
    end
  end

  class PackageJson < JsonApi
    def initialize(site, base, data)
      @dir = 'api/v1/packages'
      @name = data['package_name']
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
      super(site, base, json)
    end
  end
end
