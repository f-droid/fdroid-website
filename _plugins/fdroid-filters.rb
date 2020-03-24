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
    sdkLevel = @@AndroidSdkLevelToVersionRelation[input]
    if not sdkLevel.nil?
      return sdkLevel
    end

    return '?'
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
    29 => '10.0',
  }

  # Convert a file size to a human-readable String.
  # Source: https://codereview.stackexchange.com/q/9107
  #
  # input - File size in Bytes.
  #
  # Returns human-readable String.
  def file_size_human_readable(input)
    input = input.to_f
    i = PREFIX.length - 1
    while input > 512 && i > 0
      i -= 1
      input /= 1024
    end
    return ((input > 9 || input.modulo(1) < 0.1 ? '%d' : '%.1f') % input) + ' ' + PREFIX[i]
  end
  PREFIX = %W(TiB GiB MiB KiB B).freeze

  # Convert a SPDX license identifier to its full name.
  #
  # input - SPDX license identifier.
  #
  # Returns full license name.
  def get_license_name(input)
    if input.nil? or input.empty?
      return 'Unknown'
    end

    spdxLicense = @@SpdxLicenseNameToGnuUrlRelation[input]
    if input.end_with? "+"
      spdxLicense = @@SpdxLicenseNameToGnuUrlRelation[input.chomp('+')]
    end
    if not spdxLicense.nil?
      if input.end_with? "+"
        return spdxLicense['name'] + ' or later version'
      end

      return spdxLicense['name']
    end

    return input
  end

  # Convert a SPDX license identifier to its URL on GNU.org.
  #
  # input - SPDX license identifier.
  #
  # Returns URL on GNU.org.
  def get_license_url(input)
    if input.nil? or input.empty?
      return ''
    end

    if input.end_with? "+"
      input = input.chomp('+')
    end
    spdxLicense = @@SpdxLicenseNameToGnuUrlRelation[input]
    if not spdxLicense.nil?
      return spdxLicense['url']
    end

    return 'https://spdx.org/licenses/' + input + '.html'
  end

  # Hash with relation between SPDX license identifier and its full name and URL, mostly on GNU.org.
  # For the beginning, I only used OSI approved and frequently used licenses.
  @@SpdxLicenseNameToGnuUrlRelation = {
    'AGPL-3.0' => {
      'name' => 'GNU Affero General Public License v3.0',
      'url' => 'https://www.gnu.org/licenses/license-list.html#AGPLv3.0'
    },
    'Apache-2.0' => {
      'name' => 'Apache License 2.0',
      'url' => 'https://www.gnu.org/licenses/license-list.html#apache2'
    },
    'BSD-2-Clause' => {
      'name' => 'BSD 2-clause "Simplified" License',
      'url' => 'https://www.gnu.org/licenses/license-list.html#FreeBSD'
    },
    'BSD-3-Clause' => {
      'name' => 'BSD 3-clause "New" or "Revised" License',
      'url' => 'https://www.gnu.org/licenses/license-list.html#ModifiedBSD'
    },
    'GPL-2.0' => {
      'name' => 'GNU General Public License v2.0',
      'url' => 'https://www.gnu.org/licenses/license-list.html#GPLv2'
    },
    'GPL-3.0' => {
      'name' => 'GNU General Public License v3.0',
      'url' => 'https://www.gnu.org/licenses/license-list.html#GNUGPLv3'
    },
    'ISC' => {
      'name' => 'ISC License',
      'url' => 'https://www.gnu.org/licenses/license-list.en.html#ISC'
    },
    'LGPL-2.1' => {
      'name' => 'GNU Lesser General Public License v2.1',
      'url' => 'https://www.gnu.org/licenses/license-list.html#LGPLv2.1'
    },
    'LGPL-3.0' => {
      'name' => 'GNU Lesser General Public License v3.0',
      'url' => 'https://www.gnu.org/licenses/license-list.html#LGPLv3'
    },
    'MIT' => {
      'name' => 'MIT License',
      'url' => 'https://www.gnu.org/licenses/license-list.html#X11License'
    },
    'MPL-1.1' => {
      'name' => 'Mozilla Public License 1.1',
      'url' => 'https://www.gnu.org/licenses/license-list.html#MPL'
    },
    'MPL-2.0' => {
      'name' => 'Mozilla Public License 2.0',
      'url' => 'https://www.gnu.org/licenses/license-list.html#MPL-2.0'
    }
  }
end

Liquid::Template.register_filter(Jekyll::FDroidFilters)
