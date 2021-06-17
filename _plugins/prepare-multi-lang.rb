require 'fileutils'
require 'tmpdir'

#
# Runs the `preare-multi-lang.sh` script with `--no-type-maps` after the
# Jekyll site is writen to disk.
#
# This will actually get run once for each language that Jekyll renders.
# This is due to the way in which polyglot spins off a separate site-rendering
# process for each language.
#
# To deal with this, we write a lock file to the temp directory for each language,
# and only process the resulting site when the last lock is removed.
#

Jekyll::Hooks.register :site, :pre_render do |site|
  FileUtils.touch File.join(Dir.tmpdir, "fdroid-website.#{site.active_lang}.writing.lock")
end

Jekyll::Hooks.register :site, :post_write do |site|
  FileUtils.rm File.join(Dir.tmpdir, "fdroid-website.#{site.active_lang}.writing.lock")

  # Use dirname, because it has been patched to point at "SITE_DIR/LANG" by
  # polyglot, but we want "SITE_DIR".
  site_dir = File.dirname site.dest
  langs = site.languages + ['_']

  if langs.any? { |l| File.exists? File.join(Dir.tmpdir, "fdroid-website.#{l}.writing.lock") }
    Jekyll::logger.debug "i18n:", "Not yet fixing translations, as some are still rendering."
  else
    Jekyll::logger.info "i18n:", "Ensuring default English translation is in webroot."
    script = File.join(File.dirname(__FILE__), "../tools/prepare-multi-lang.sh")
    %x[#{script} #{site_dir} --no-type-maps]

    # trigger forever caching after i18n is done
    Jekyll::Hooks.trigger :i18n, :post_write
  end
end
