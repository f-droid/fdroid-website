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
    def self.parse_frontmatter(document, frontmatter_key)
      site = document.site
      value = document.data[frontmatter_key]

      # Value has at least one word, followed by a dot, followed by more words and dots.
      return if value !~ /^[\w\-]+\.[\w\-.]+$/

      value_parts = value.split(/\./)
      new_value = recursively_get_value(site.data, value_parts)

      if new_value && new_value.length > 0
        Jekyll::logger.debug "i18n", "Translating document frontmatter [#{frontmatter_key}: #{value}] to #{site.active_lang}: \"#{new_value}\""
        document.data[frontmatter_key] = new_value
      end
    end

    #
    # Data is a hash with string keys, and each value is either another hash, or
    # a string value, e.g:
    #
    # { "one" => { "two" => "Two"} }
    #
    # Keys is an array of strings, which represent successive indexes into the
    # data hash, e.g:
    #
    # [ "one", "two" ]
    #
    # Will recursively search the data hash for a matching key, then return that
    # value, or nil if not found.
    #
    def self.recursively_get_value(data, keys)
      keys.reduce(data) { |hash, key| hash.is_a?(Hash) ? hash[key] : nil }
    end
  end
end
