require 'digest'

#
# Provides a "forever caching" asset tag & filter that outputs e.g.
# /assets/foobar_${SHA256}.png and hard links this to the original file:
#
#   {% asset foobar.png %}
#   {{ some_var | append: '.png' | asset }}
#
# Hooks into i18n (prepare-multi-lang.rb) to avoid concurrency issues.
#
# CAVEATS:
#
# * assumes 1 site
# * assumes all languages have the same assets
# * assumes assets exists and will be copied unmodified from e.g. assets/ to _site/assets/
# * hard links .js assets into assets/ (not js/)
#

module Jekyll
  module ForeverCache
    @@baseurl = Jekyll.sites.first.baseurl
    @@destination = Jekyll.sites.first.dest
    @@assets = {}

    def self.link_to_asset!(input)
      ext   = File.extname input
      base  = File.basename input, '.*'
      path  = "#{directory ext}/#{input}"
      file  = destination path
      unless @@assets.has_key? file
        asset = "/assets/#{base}_#{digest path}#{ext}"
        @@assets[file] = { path: asset, file: destination(asset) }
      end
      @@baseurl + @@assets[file][:path]
    end

    def self.destination(path)
      File.join @@destination, *path.split('/')
    end

    def self.digest(path)
      Digest::SHA256.file(File.join(*path.split('/'))).hexdigest
    end

    def self.directory(ext)
      case ext
      when /^\.(css|js)$/
        $1
      else
        'assets'
      end
    end

    def self.link_assets!
      Jekyll::logger.info 'forever:', 'Linking assets.'
      @@assets.each do |file, asset|
        forever = asset[:file]
        next if File.exist? forever
        Jekyll::logger.debug 'forever:', "Linking #{forever} to #{file}."
        File.link file, forever
      end
    end
  end

  class ForeverCacheTag < Liquid::Tag
    def initialize(tag_name, input, tokens)
      super
      @input = input
    end

    def render(context)
      Jekyll::ForeverCache.link_to_asset! @input.strip
    end
  end

  module ForeverCacheFilter
    def asset(input)
      Jekyll::ForeverCache.link_to_asset! input.strip
    end
  end
end

Liquid::Template.register_filter Jekyll::ForeverCacheFilter
Liquid::Template.register_tag 'asset', Jekyll::ForeverCacheTag

# after i18n is done
Jekyll::Hooks.register :i18n, :post_write do
  Jekyll::ForeverCache.link_assets!
end
