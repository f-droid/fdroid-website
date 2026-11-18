module JekyllIncludeCache

  #
  # Modification to always pass in `site.active_lang` as a cache key parameter
  # for better resilience alongside `jekyll-polyglot` with `parallel_localization`
  # and Jekyll::Cache with disk cache (default on) in Jekyll v4
  #
  class Tag < Jekyll::Tags::IncludeTag
    def parse_params(context)
      super.tap do |params|
        unless params.key?("lang")
          site = context.registers[:site]
          if site.active_lang
            Jekyll::logger.debug "Adding lang=#{site.active_lang} to include-cached tag params with keys: #{params.keys}"
            params["lang"] = site.active_lang
          end
        end
      end
    end
  end
end
