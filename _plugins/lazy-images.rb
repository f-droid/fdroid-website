# Jekyll Plugin: Lazy Load Images Filter
#
# Copyright (C) 2026 F-Droid contributors
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Adds loading="lazy" to <img> tags in rendered content that do not already
# have a loading attribute specified.
#
module Jekyll
  module LazyImagesFilter
    def lazy_images(html)
      return html unless html.is_a?(String)

      html.gsub(/<img\b(?![^>]*\sloading\s*=)([^>]*?)>/i) do |_match|
        "<img loading=\"lazy\"#{$1}>"
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::LazyImagesFilter)

