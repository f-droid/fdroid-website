#
# Apply (monkey) patches from _patches directory after custom plugins and gem files have loaded.
#
Jekyll::Hooks.register :site, :after_init do |site|
  patch_files = Jekyll::Utils.safe_glob(site.in_source_dir("_patches"), File.join("**", "*.rb"))
  puts "Applying patch files from _patches: #{patch_files}"
  Jekyll::External.require_with_graceful_fail(patch_files)
end
