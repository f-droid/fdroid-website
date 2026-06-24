# frozen_string_literal: true

module Jekyll
  # Jekyll v4.3.2 backported a 'bugfix' to "Optimize `Site#each_site_file`":
  # https://github.com/jekyll/jekyll/pull/9256
  # by dropping deduplication which was meant to be "additional checks
  # to filter duplicate entries of static files from a collection."
  # It apparently assumed unique entries across collections
  # which might not be the case for `jekyll-fdroid` utilizing collections
  # for pagination with `jekyll-paginate-v2`: eg if an app falls under
  # several categories, the app details page would appear as duplicates
  # across the collections for those app categories during the walk-through.
  # This reinstates deduplication, but comparing by identity
  # for hopefully better performance, thus saving the log from flooded with
  # "Conflict: The following destination is shared by multiple files." warnings.
  #
  if Gem::Version.new(VERSION) >= Gem::Version.new("4.3.2")
    require "set"

    class Site
      alias each_site_file_orig each_site_file

      def each_site_file
        seen_files = Set.new.compare_by_identity
        each_site_file_orig do |item|
          unless seen_files.include?(item)
            yield item
            seen_files << item
          end
        end
      end
    end
  end
end
