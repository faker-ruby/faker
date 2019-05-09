# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHoliday < Test::Unit::TestCase
  def setup
    @tester = Faker::Holiday
  end

  def test_name
    assert @tester.name.match(/\w+/)
  end

  def test_date
    today = Date.today
    next_year = Date.today + 365

    100.times do
      random_date = @tester.date
      assert random_date > today, "Expected > \"#{today}\", but got #{random_date}"
      assert random_date < next_year, "Expected < \"#{next_year}\", but got #{random_date}"
    end
  end
end
