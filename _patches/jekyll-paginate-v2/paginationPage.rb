module Jekyll
  module PaginateV2::Generator

    #
    # Modification to address a layout caching bug under Jekyll v4
    # See https://github.com/sverrirs/jekyll-paginate-v2/pull/260
    # Adapted from https://github.com/jameshi16/jekyll-paginate-v2/blob/cache-mismatch-error/lib/jekyll-paginate-v2/generator/paginationPage.rb
    #
    class PaginationPage < Page
      alias initialize_orig initialize
      def initialize(page_to_copy, cur_page_nr, total_pages, index_pageandext)
        initialize_orig(page_to_copy, cur_page_nr, total_pages, index_pageandext)
        @name = (index_pageandext.nil? || index_pageandext == '.html') ? 'index.html' : index_pageandext
        @path = page_to_copy.path

        self.process(@name) # Creates the basename and ext member values
      end

      alias set_url_orig set_url
      def set_url(url_value)
        set_url_orig(url_value)
        @path = url_value[0] == '/' ? url_value[1..-1] : url_value
        @dir = File.dirname(@path)
      end
    end

  end
end
