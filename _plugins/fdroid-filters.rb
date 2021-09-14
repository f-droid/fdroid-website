# F-Droid's Jekyll Plugin
#
# Copyright (C) 2017 Nico Alt
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

module Jekyll::FDroidFilters
  # Convert an Android SDK level into an Android version.
  #
  # input - Android SDK Level.
  #
  # Returns the Android version.
  def android_sdk_level_to_version(input)
    @@AndroidSdkLevelToVersionRelation.fetch(input, '?')
  end

  # Hash with relation between Android SDK Level and Android version
  # https://source.android.com/setup/build-numbers
  @@AndroidSdkLevelToVersionRelation = {
    1 => '1.0',
    2 => '1.1',
    3 => '1.5',
    4 => '1.6',
    5 => '2.0',
    6 => '2.0.1',
    7 => '2.1',
    8 => '2.2',
    9 => '2.3',
    10 => '2.3.3',
    11 => '3.0',
    12 => '3.1',
    13 => '3.2',
    14 => '4.0',
    15 => '4.0.3',
    16 => '4.1',
    17 => '4.2',
    18 => '4.3',
    19 => '4.4',
    20 => '4.4W',
    21 => '5.0',
    22 => '5.1',
    23 => '6.0',
    24 => '7.0',
    25 => '7.1',
    26 => '8.0',
    27 => '8.1',
    28 => '9.0',
    29 => '10',
    30 => '11',
    31 => '12',
  }

  # Convert a file size to a human-readable String.
  # Source: https://codereview.stackexchange.com/q/9107
  #
  # input - File size in Bytes.
  #
  # Returns human-readable String.
  def file_size_human_readable(input)
    input = input.to_f
    i = SUFFIX.length - 1
    while input > 512 && i > 0
      i -= 1
      input /= 1024
    end
    ((input > 9 || input.modulo(1) < 0.1 ? '%d' : '%.1f') % input) + ' ' + SUFFIX[i]
  end

  SUFFIX = %w(TiB GiB MiB KiB B).freeze
end

Liquid::Template.register_filter(Jekyll::FDroidFilters)
