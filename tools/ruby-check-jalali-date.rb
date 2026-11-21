#!/usr/bin/env ruby
#
# Checks the Jalali dates from _plugins/jalali-date.rb against
# tools/jalali-leap-years.txt, the official table of Jalali new year dates
# and leap years.
#
#   bundle exec ruby tools/ruby-check-jalali-date.rb

require 'date'
require 'liquid'
require_relative '../_plugins/jalali-date'
require_relative '../_plugins/fdroid-filters'

J = Jekyll::JalaliDate
FAILURES = []

def check(what, got, expected)
  return if got == expected

  FAILURES << "#{what}: got #{got.inspect}, expected #{expected.inspect}"
end

# Each line is a year, a star if it's a leap year, and the Gregorian date of
# its first day, e.g. "1403* 2024-03-20".
table = {}
File.foreach(File.join(__dir__, 'jalali-leap-years.txt')) do |line|
  year, stars, first_day = line.match(/^(\d+)(\**) (\d{4}-\d\d-\d\d)$/)&.captures
  next if year.nil?

  table[year.to_i] = { leap: !stars.empty?, new_year: Date.parse(first_day) }
end

years = J::FIRST_YEAR..J::LAST_YEAR
missing = years.reject { |year| table.key?(year) }
abort "jalali-leap-years.txt has nothing for #{missing.join(', ')}" unless missing.empty?

years.each do |year|
  check("new_year(#{year})", J.new_year(year), table[year][:new_year])
  check("leap_year?(#{year})", J.leap_year?(year), table[year][:leap])
end

# Walk through every day of the range. Starting at 1 Farvardin and taking
# month lengths from the table, each day has exactly one right answer.
day = table[J::FIRST_YEAR][:new_year]
last_day = table[J::LAST_YEAR][:new_year] + (table[J::LAST_YEAR][:leap] ? 365 : 364)
expected = [J::FIRST_YEAR, 1, 1]

while day <= last_day
  got = J.from_date(day)
  if got != expected
    check("from_date(#{day})", got, expected)
    break
  end

  y, m, d = expected
  month_length = if m <= 6 then 31
                 elsif m <= 11 then 30
                 elsif table[y][:leap] then 30
                 else 29
                 end
  expected = if d < month_length then [y, m, d + 1]
             elsif m < 12 then [y, m + 1, 1]
             else [y + 1, 1, 1]
             end
  day += 1
end

check('the day before the range', J.from_date(table[J::FIRST_YEAR][:new_year] - 1), nil)
check('the day after the range', J.from_date(last_day + 1), nil)

# 7 Ordibehesht 1405. Day and month differ and both are one digit, so a
# swapped field or a missing zero shows up.
sample = Date.new(2026, 4, 27)
{
  '%-d %B %Y' => '7 اردیبهشت 1405',
  '%d/%m/%Y' => '07/02/1405',
  '%-m/%-d' => '2/7',
  '%F' => '1405-02-07',
  '%y' => '05',
  '%b' => 'اردیبهشت',
  '100%%' => '100%',
  '%H:%M' => '%H:%M'
}.each do |pattern, text|
  check("strftime(#{pattern.inspect})", J.strftime(sample, pattern), text)
end
check('strftime outside the range', J.strftime(Date.new(1800, 1, 1), '%F'), nil)

# The filter itself, called the way the templates call it.
class FakePage
  include Liquid::StandardFilters
  include Jekyll::FDroidFilters
  include Jekyll::JalaliDateFilter

  def initialize(lang)
    site = Struct.new(:active_lang).new(lang)
    @context = Struct.new(:registers).new({ site: site })
  end
end

fa = FakePage.new('fa')
en = FakePage.new('en')
check('fa page', fa.localized_date(sample, '%b %d, %Y'), '۷ اردیبهشت ۱۴۰۵')
check('fa page, date as text', fa.localized_date('2026-04-27', '%b %d, %Y'), '۷ اردیبهشت ۱۴۰۵')
check('en page', en.localized_date(sample, '%b %d, %Y'), 'Apr 27, 2026')
check('fa page outside the range', fa.localized_date(Date.new(1800, 1, 1), '%Y-%m-%d'), '1800-01-01')

if FAILURES.empty?
  puts "jalali-date: all good, #{years.size} years and every day in them checked"
else
  puts FAILURES
  abort "jalali-date: #{FAILURES.size} problem(s)"
end
