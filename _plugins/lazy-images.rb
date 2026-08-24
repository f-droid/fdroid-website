# Jekyll Plugin: Lazy Load Images Filter
#
# Adds loading="lazy" to <img> tags in rendered content that do not already
# have a loading attribute specified.
#
module Jekyll
  module LazyImagesFilter
    def lazy_images(html)
      return html unless html.is_a?(String)

      html.gsub(/<img\b(?![^>]*\bloading=)([^>]*?)>/i) do |_match|
        "<img loading=\"lazy\"#{$1}>"
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::LazyImagesFilter)
