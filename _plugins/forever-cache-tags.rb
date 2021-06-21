require 'base64'
require 'digest'
require 'fileutils'
require 'tmpdir'

#
# Provides a "forever caching" asset tag & filter that outputs e.g.
# /assets/foobar_${SHA256}.png and hard links this to the original file:
#
#   {% asset foobar.png %}
#   {{ some_var | append: '.png' | asset }}
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
      Base64.urlsafe_encode64 Digest::SHA256.file(File.join(*path.split('/'))).digest
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

    def self.last_process?(site)
      languages = site.languages + ['_']
      File.open(@@lockfile, File::RDWR|File::CREAT, 0644) do |f|
        f.flock File::LOCK_EX
        value = f.read.to_i + 1
        f.rewind
        f.write "#{value}\n"
        f.flush
        f.truncate f.pos
        value == languages.length
      end
    end

    def self.after_init_hook(site)
      @@baseurl = site.baseurl
      @@destination = site.dest
      @@lockfile = File.join Dir.tmpdir, 'fdroid-website.lock'  # FIXME
      FileUtils.rm_f @@lockfile
    end

    def self.post_write_hook(site)
      if last_process? site
        link_assets!
        FileUtils.rm_f @@lockfile
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

Jekyll::Hooks.register :site, :after_init do |site|
  Jekyll::ForeverCache.after_init_hook site
end

Jekyll::Hooks.register :site, :post_write do |site|
  Jekyll::ForeverCache.post_write_hook site
end
