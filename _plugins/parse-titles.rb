#
# If a document title is a "." separated string, which matches an entry in the
# site.data hash, then it will be translated to the matching value.
#
Jekyll::Hooks.register :site, :post_read do |site|
  site.documents.each do |document|
    document.data.each do |key, value|
      Jekyll::ParseTitles.parse_frontmatter(document, key)
    end
  end
end

module Jekyll
  module ParseTitles
    DOTTED_KEY_REGEX = /\A[\w\-]+(?:\.[\w\-]+)+\z/.freeze

    def self.parse_frontmatter(document, frontmatter_key)
      site = document.site
      value = document.data[frontmatter_key]

      return unless value.is_a?(String)
      return unless value.include?('.')
      return unless DOTTED_KEY_REGEX.match?(value)

      value_parts = value.split('.')
      new_value = site.data.dig(*value_parts)

      if new_value && !new_value.empty?
        Jekyll::logger.debug "i18n", "Translating document frontmatter [#{frontmatter_key}: #{value}] to #{site.active_lang}: \"#{new_value}\""
        document.data[frontmatter_key] = new_value
      end
    end
  end
end
