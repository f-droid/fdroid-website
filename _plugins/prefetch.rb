#
# Prefetch from network early so that a cached copy would be available on fork during jekyll-polyglot's parallel_localization
#
Jekyll::Hooks.register :site, :after_init do |site|
  fdroid_index = FDroid::Index.class(site.config.dig("jekyll-fdroid", "index_version"))

  #
  # Opportunistically verifies downloaded index files against their signatures with the local key
  #
  begin
    require 'net/http'
    require 'gpgme'

    #
    # Imports the local key `admin@f-droid.org.gpg` from source directory for verification of GPG signatures.
    # Additional keys (ending with *.gpg) may be placed in _keys directory for import.
    #
    [site.in_source_dir('admin@f-droid.org.gpg'), site.in_source_dir('_keys')].each do |key|
      next unless File.exist? key
      if File.directory? key
        puts "Importing local keys from #{key}"
        Jekyll::Utils.safe_glob(local_key, File.join("**", "*.gpg"))
      else
        [key]
      end.each do |local_key|
        puts "Importing local key from #{local_key}"
        GPGME::Key.import(File.open(local_key)).tap do |import_result|
          import_result.imports.each do |s|
            puts "- Fingerprint: #{s.fingerprint}, Result: #{s.result}, Status: #{s.status}"
          end
        end
      end
    end

    def verify_sig(sig, data)
      GPGME::Crypto.new.verify(sig, signed_text: data) do |signature|
        begin
          puts "Signature #{signature.valid? ? 'valid' : 'invalid'}: #{signature}"
          puts "Fingerprint: #{signature.fingerprint}, Summary: #{signature.summary}, Status: #{signature.status}"
        rescue => e
          Jekyll::logger.warn 'GPGME::Signature:', "Caught an exception: #{e.class} - #{e.message}"
        end
        return false unless signature.valid?
      end
      true
    end

    def verify_gpg(index, repo)
      sig_uri = repo.is_a?(URI) ? repo.dup : URI.parse(repo)
      path = sig_uri.path
      base_name = File.basename(path, File.extname(path))
      sig_uri.path = File.join(File.dirname(path), base_name + '.json.asc') 

      verify_level = sig_uri.host == 'f-droid.org' ? 2 : 1
      Jekyll::logger.info 'verify_gpg:', "Downloading GPG signature file for #{repo} from #{sig_uri.to_s}"
      response = Net::HTTP.get_response(sig_uri)
      case response
      when Net::HTTPSuccess then
        if verify_sig(response.body, index)
          Jekyll::logger.info 'verify_gpg:', "Verified GPG signature of #{repo} against #{sig_uri.to_s}"
          index
        else
          Jekyll::logger.error 'verify_gpg:', "Failed to verify GPG signature of #{repo} against #{sig_uri.to_s}"
          if verify_level >= 2
            Jekyll::logger.abort_with 'verify_gpg:', "Aborting on failed verification of #{repo} against GPG signature #{sig_uri.to_s}"
          end
          verify_level >= 1 ? nil : index
        end
      else
        Jekyll::logger.warn 'verify_gpg:', "Error while trying to verify GPG signature of #{repo} against #{sig_uri.to_s}: #{response.code} - #{response.message}"
        if verify_level >= 2
          Jekyll::logger.abort_with 'verify_gpg:', "Aborting on failing to get GPG signature for #{repo} from #{sig_uri.to_s}"
        end
        index
      end
    end

    [FDroid::Signer::Index, fdroid_index].each do |prefetch|
      prefetch.singleton_class.class_eval do
        alias download_index_work download_index
        def download_index(repo)
          if class_variable_get(:@@downloaded_repos).has_key? repo
            return class_variable_get(:@@downloaded_repos)[repo]
          end

          download_index_work(repo)&.yield_self do |index|
            verify_gpg(index, repo) || begin
              if class_variable_get(:@@downloaded_repos).has_key? repo
                Jekyll::logger.info 'verify_gpg:', "Evicting @@downloaded_repos cache for #{repo}"
                class_variable_get(:@@downloaded_repos).delete repo
              end
              nil
            end
          end
        end
      end
    end
  rescue LoadError => e
    Jekyll::logger.warn "Failed to load ruby-gpgme: #{e.message}. Proceeding without GPG verification."
  end

  FDroid::Signer::Index.download(site.config['fdroid-repo']).tap do |index|
    if index
      site.data['fdroid-signers'] = index
      Jekyll::logger.info 'fdroid-signers:', "Prefetched signers for #{index.size} packages"
    end
  end

  fdroid_index.singleton_class.class_eval do
    #
    # Adds a couple of extra logging around network requests from FDroid::Index just for debugging purposes
    #
    alias download_index_orig download_index
    def download_index(repo)
      Jekyll::logger.info 'download_index:', "cached: #{class_variable_get(:@@downloaded_repos).has_key? repo}, repo: #{repo}"
      download_index_orig(repo)
    end

    alias download_index_logging download_index
    def download_index(repo)
      throw :prefetch_done, "prefetched length=#{download_index_logging(repo)&.length} from #{repo}"
    end

    catch(:prefetch_done) do
      fdroid_index.download(site.config["fdroid-repo"], nil)
    end.tap do |result|
      Jekyll::logger.info 'download_index:', "Prefetch done: #{result.is_a?(String) ? result : result.class}"
    end

    alias download_index download_index_logging
  end
end
