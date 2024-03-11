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
    i18n_number(@@AndroidSdkLevelToVersionRelation.fetch(input, '?'))
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
    32 => '12L',
    33 => '13',
    34 => '14',
  }

  def i18n_number(number)
    site = @context.registers[:site]
    if site.active_lang == 'ar' and number.to_s.match?(/^[0-9.]+$/)
      return number.to_s.gsub(/[0-9.]/,
                              '0' => "\u{0660}",
                              '1' => "\u{0661}",
                              '2' => "\u{0662}",
                              '3' => "\u{0663}",
                              '4' => "\u{0664}",
                              '5' => "\u{0665}",
                              '6' => "\u{0666}",
                              '7' => "\u{0667}",
                              '8' => "\u{0668}",
                              '9' => "\u{0669}",
                              '.' => "\u{066B}",
                             )
    elsif site.active_lang == 'fa' and number.to_s.match?(/^[0-9.]+$/)
      return number.to_s.gsub(/[0-9.]/,
                              '0' => "\u{06F0}",
                              '1' => "\u{06F1}",
                              '2' => "\u{06F2}",
                              '3' => "\u{06F3}",
                              '4' => "\u{06F4}",
                              '5' => "\u{06F5}",
                              '6' => "\u{06F6}",
                              '7' => "\u{06F7}",
                              '8' => "\u{06F8}",
                              '9' => "\u{06F9}",
                              '.' => "\u{066B}",
                             )
    end
    return number  # return unchanged if none of the conditions were met
  end

  # Convert a file size to a human-readable String.
  # Source: https://codereview.stackexchange.com/q/9107
  #
  # input - File size in Bytes.
  #
  # Returns human-readable String.
  def file_size_human_readable(input)
    input = input.to_f
    site = @context.registers[:site]
    p = site.data["strings"]["package"]
    units = [
      p["file_size_tebibytes"],
      p["file_size_gibibytes"],
      p["file_size_mebibytes"],
      p["file_size_kibibytes"],
      p["file_size_bytes"]
    ]
    i = units.length - 1
    while input > 512 && i > 0
      i -= 1
      input /= 1024
    end
    number = ((input > 9 || input.modulo(1) < 0.1 ? '%d' : '%.1f') % input)
    p["file_size_format"] % {:number => i18n_number(number), :unit => units[i]}
  end
end

Liquid::Template.register_filter(Jekyll::FDroidFilters)
