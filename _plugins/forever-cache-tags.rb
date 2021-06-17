require 'digest'

module Jekyll
  module ForeverCache
    # NB: assumes only 1 site
    @@baseurl = Jekyll.sites.first.baseurl
    @@destination = Jekyll.sites.first.dest
    @@assets = {}

    def self.link_to_asset!(input)
      ext   = File.extname input
      path  = "#{directory ext}/#{input}"
      file  = destination path
      unless @@assets.has_key? file
        asset = "/assets/forever_#{digest path}#{ext}"
        @@assets[file] = { path: asset, file: destination(asset) }
      end
      @@baseurl + @@assets[file][:path]
    end

    def self.destination(path)
      File.join @@destination, *path.split('/')
    end

    # FIXME: assumes asset exists and will be copied unmodified from
    # e.g. assets/ to _site/assets/
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
      @@assets.each do |file, asset|
        forever = asset[:file]
        next if File.exist? forever
        STDERR.puts "linking #{forever} to #{file}..." # FIXME
        begin
          File.link file, forever
        rescue SystemCallError
          raise unless File.exist? forever
        end
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

Jekyll::Hooks.register :site, :post_write do
  Jekyll::ForeverCache.link_assets!
end
