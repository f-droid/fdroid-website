# F-Droid's Jekyll Plugin
#
# Copyright (C) 2026 Goudarz Jafari <hi@goudarzjafari.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

require 'date'

module Jekyll
  # Gregorian to Jalali (Solar Hijri) date conversion.
  #
  # A Jalali year has 365 days, or 366 in a leap year, and leap years follow
  # a fixed 33-year cycle. So converting a date only takes knowing when one
  # year started and counting from there.
  #
  # The cycle matches the official calendar from 1210 to 1498 (1831 to 2119)
  # and tools/ruby-check-jalali-date.rb checks every day of that range. Outside
  # it we return nil rather than a date we can't vouch for.
  module JalaliDate
    module_function

    FIRST_YEAR = 1210
    LAST_YEAR = 1498

    # 1 Farvardin 1210
    EPOCH = ::Date.new(1831, 3, 21)

    # Where the leap years fall in each 33-year cycle, FIRST_YEAR being 1.
    LEAP_YEARS_IN_CYCLE = [1, 5, 9, 13, 17, 21, 25, 29].freeze

    MONTH_NAMES = [
      'فروردین', 'اردیبهشت', 'خرداد', 'تیر', 'مرداد', 'شهریور',
      'مهر', 'آبان', 'آذر', 'دی', 'بهمن', 'اسفند'
    ].freeze

    def leap_year?(year)
      LEAP_YEARS_IN_CYCLE.include?((year - FIRST_YEAR) % 33 + 1)
    end

    # The Gregorian date of 1 Farvardin of the given year.
    def new_year(year)
      years = year - FIRST_YEAR
      leap_years = years / 33 * 8 + LEAP_YEARS_IN_CYCLE.count { |n| n <= years % 33 }
      EPOCH + years * 365 + leap_years
    end

    # [year, month, day] in the Jalali calendar, or nil outside the range.
    def from_date(date)
      return nil if date < EPOCH || date >= new_year(LAST_YEAR + 1)

      year = date.year - 621
      year -= 1 if date < new_year(year)
      day = (date - new_year(year)).to_i

      # Six months of 31 days, then five of 30, then Esfand with 29 or 30.
      if day < 186
        [year, day / 31 + 1, day % 31 + 1]
      else
        [year, (day - 186) / 30 + 7, (day - 186) % 30 + 1]
      end
    end

    # Like Date#strftime, for the handful of directives that dates on this
    # site use. Anything else is left as it is. Nil outside the range.
    def strftime(date, pattern)
      year, month, day = from_date(date)
      return nil if year.nil?

      values = {
        '%Y' => year.to_s,
        '%y' => format('%02d', year % 100),
        '%m' => format('%02d', month),
        '%-m' => month.to_s,
        '%d' => format('%02d', day),
        '%-d' => day.to_s,
        '%B' => MONTH_NAMES[month - 1],
        '%b' => MONTH_NAMES[month - 1],
        '%F' => format('%d-%02d-%02d', year, month, day),
        '%%' => '%'
      }
      pattern.gsub(Regexp.union(values.keys), values)
    end
  end

  # {{ some_date | localized_date: site.data.strings.news.date_format }}
  #
  # On Persian pages this shows a Jalali date with Persian digits. Every
  # other language gets exactly what Liquid's own `date` filter gives.
  module JalaliDateFilter
    # The translated news.date_format is meant for Gregorian dates, so
    # Persian pages use this one instead.
    PERSIAN_FORMAT = '%-d %B %Y'.freeze

    def localized_date(input, format)
      return date(input, format) unless @context.registers[:site].active_lang == 'fa'

      time = Liquid::Utils.to_date(input)
      jalali = time && JalaliDate.strftime(time.to_date, PERSIAN_FORMAT)
      return date(input, format) if jalali.nil?

      # i18n_number, from fdroid-filters.rb, only converts a string that is
      # all digits, so hand it the numbers one at a time.
      jalali.gsub(/\d+/) { |number| i18n_number(number) }
    end
  end
end

Liquid::Template.register_filter(Jekyll::JalaliDateFilter)
