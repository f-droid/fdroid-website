require 'net/http'
require 'json'
require 'uri'

#
# Fetch and load the list of official f-droid.org signers into site.data['fdroid-signers'] hash,
# against which the `signer` field of package apks would be checked to see if they are signed by f-droid.org.
#
Jekyll::Hooks.register :site, :post_read do |site|
  return if site.data['fdroid-signers']

  uri = URI.parse "#{site.config['fdroid-repo']}/signer-index.json"
  begin
    response = Net::HTTP.get_response(uri)
  rescue Net::OpenTimeout, Net::ReadTimeout => e
    puts "Timeout (#{e}), retrying in 1 second..."
    sleep(1)
    retry
  end
  index = JSON.parse(response.body)
  if index
    site.data['fdroid-signers'] = index
    Jekyll::logger.info 'fdroid-signers', "Fetched and loaded official f-droid.org signers for #{index.size} packages from #{uri.to_s}"
  end
end
