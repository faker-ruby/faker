# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBirthdayInLeapYear < Test::Unit::TestCase
  def setup
    @tester = Faker::Date
    @today = Date.parse('2016-02-29')
    @min = 18
    @max = 65
  end

  def teardown
    Timecop.return
  end

  def test_birthday_in_leap_year
    Timecop.freeze(@today)
    assert_nothing_raised ArgumentError do
      @tester.birthday
    end

    assert_raise ArgumentError do
      ::Date.new(@today.year - @min, @today.month, @today.day)
    end

    assert_raise ArgumentError do
      ::Date.new(@today.year - @max, @today.month, @today.day)
    end
  end
end
