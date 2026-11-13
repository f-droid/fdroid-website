# frozen_string_literal: true

module Jekyll
  module Commands
    class Doctor < Command
      class << self

        def conflicting_urls(site)
          conflicting_urls = false
          destination_map(site).each do |dest, paths|
            next unless paths.size > 1

            conflicting_urls = true
            next if site.config.dig("silence_conflicting_urls") == true

            # Avoid warn logs that are affecting the build on CI
            Jekyll.logger.warn "Conflict:",
                               "The following destination is shared by multiple files."
            Jekyll.logger.warn "", "The written file may end up with unexpected contents."
            Jekyll.logger.warn "", dest.to_s.cyan
            paths.each { |path| Jekyll.logger.warn "", " - #{path}" }
          end
          conflicting_urls
        end

      end
    end
  end
end
