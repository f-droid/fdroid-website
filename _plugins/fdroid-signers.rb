require 'net/http'
require 'json'
require 'uri'

#
# Fetch and load the list of official f-droid.org signers into site.data['fdroid-signers'] hash,
# against which the `signer` field of package apks would be checked to see if they are signed by f-droid.org.
#
module FDroid
  module Signer
    class Index
      @@downloaded_repos = {}

      def self.download(repo)
        if @@downloaded_repos.has_key? repo
          return @@downloaded_repos[repo]
        end

        uri = URI.parse "#{repo}/signer-index.json"
        @@downloaded_repos[repo] = download_index(uri)&.yield_self do |content|
          JSON.parse(content).tap do |index|
            puts "Fetched signers for #{index.size} packages from #{uri.to_s}"
          end
        end
      end

      # Make a network request, download the signer-index.json file from the repo.
      # @param [string] uri
      # @return [String]
      def self.download_index(uri)
        begin
          response = Net::HTTP.get_response(uri)
        rescue Net::OpenTimeout, Net::ReadTimeout => e
          puts "Timeout (#{e}), retrying in 1 second..."
          sleep(1)
          retry
        end

        case response
        when Net::HTTPSuccess then
          response.body
        when Net::HTTPClientError then
          puts "HTTP Error #{response.code}: could not populate fdroid-signers from #{uri.to_s}"
        when Net::HTTPRedirection then
          puts "fdroid-signers #{uri.to_s} redirected to: #{response['location']}, ignoring."
        else
          puts "fdroid-signers: Error while trying to get signers from #{uri.to_s}: #{response.code} - #{response.message}"
        end
      end
    end
  end
end

Jekyll::Hooks.register :site, :post_read do |site|
  return if site.data['fdroid-signers']

  index = FDroid::Signer::Index.download(site.config['fdroid-repo'])
  if index
    site.data['fdroid-signers'] = index
    Jekyll::logger.info 'fdroid-signers:', "Loaded signers for #{index.size} packages"
  end
end
