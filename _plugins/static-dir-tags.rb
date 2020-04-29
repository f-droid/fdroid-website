
# jekyll-polyglot relativizes links, and the only way to disable it is
# to prepare a space to the URL.  So this does that for the assets folder,
# to keep this weird thing clear and documented.
module Jekyll
  class StopPolyglotRelativizeTag < Liquid::Tag
    def initialize(tag_name, input, tokens)
      super
      if tag_name == "root"
        @path_bit = ""
      else
        @path_bit = "/" + tag_name
      end
    end

    def lookup(context, name)
      lookup = context
      name.split(".").each { |value| lookup = lookup[value] }
      lookup
    end

    def render(context)
      baseurl = "#{lookup(context, 'site.baseurl')}"
      baseurl + @path_bit
    end
  end

  class AssetsTag < StopPolyglotRelativizeTag
  end

  class RootTag < StopPolyglotRelativizeTag
  end
end

Liquid::Template.register_tag('assets', Jekyll::AssetsTag)
Liquid::Template.register_tag('css', Jekyll::AssetsTag)
Liquid::Template.register_tag('js', Jekyll::AssetsTag)
Liquid::Template.register_tag('root', Jekyll::RootTag)
