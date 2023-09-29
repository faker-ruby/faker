# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDate < Test::Unit::TestCase
  def setup
    @tester = Faker::Date
  end

  def test_between
    from = Date.parse('2012-01-01')
    to   = Date.parse('2013-01-01')

    deterministically_verify -> { @tester.between(from: from, to: to) }, depth: 5 do |random_date|
      assert_operator random_date, :>=, from, "Expected >= \"#{from}\", but got #{random_date}"
      assert_operator random_date, :<=, to, "Expected <= \"#{to}\", but got #{random_date}"
    end
  end

  def test_between_except
    from     = Date.parse('2012-01-01')
    to       = Date.parse('2012-01-05')
    excepted = Date.parse('2012-01-03')

    deterministically_verify -> { @tester.between_except(from: from, to: to, excepted: excepted) }, depth: 5 do |random_date|
      assert_not_nil random_date
      refute_equal random_date, excepted, "Expected != \"#{excepted}\", but got #{random_date}"
    end
  end

  def test_between_except_with_strings
    from     = '2012-01-01'
    to       = '2012-01-05'
    excepted = '2012-01-03'

    excepted_date = Date.parse(excepted)

    deterministically_verify -> { @tester.between_except(from: from, to: to, excepted: excepted) }, depth: 5 do |random_date|
      assert_not_nil random_date
      refute_equal random_date, excepted_date, "Expected != \"#{excepted}\", but got #{random_date}"
    end
  end

  def test_between_except_with_same_from_to_and_except
    assert_raise ArgumentError do
      @tester.between_except('2012-01-01', '2012-01-01', '2012-01-01')
    end
  end

  def test_forward
    today = Date.today

    deterministically_verify -> { @tester.forward(days: 5) }, depth: 5 do |random_date|
      assert_operator random_date, :>, today, "Expected > \"#{today}\", but got #{random_date}"
    end
  end

  def test_forward_with_from_parameter
    from = Date.parse('2012-01-01')
    five_days_after_from = from + 5
    random_date = @tester.forward(from: from, days: 5)

    assert_operator random_date, :>, from, "Expected > \"#{from}\", but got #{random_date}"
    assert_operator five_days_after_from, :>, from, "Expected < \"#{from}\", but got #{random_date}"
  end

  def test_forward_with_string_parameter
    from = '2012-01-01'

    from_date = Date.parse(from)

    deterministically_verify -> { @tester.forward(from: from, days: 5) }, depth: 5 do |random_date|
      assert_operator random_date, :>, from_date, "Expected > \"#{from}\", but got #{random_date}"
    end
  end

  def test_backward
    today = Date.today

    deterministically_verify -> { @tester.backward(days: 5) }, depth: 5 do |random_date|
      assert_operator random_date, :<, today, "Expected < \"#{today}\", but got #{random_date}"
    end
  end

  def test_return_type
    random_forward  = @tester.forward(days: 5)
    random_backward = @tester.backward(days: 5)
    random_between  = @tester.between(from: Date.today, to: Date.today + 5)

    [random_forward, random_backward, random_between].each do |result|
      assert result.is_a?(Date), "Expected a Date object, but got #{result.class}"
    end
  end

  def test_invalid_date
    assert_raise ArgumentError do
      @tester.between('9999-99-99', '9999-99-99')
    end
  end

  def test_birthday
    min = 40
    max = 90

    t = Date.today
    birthdate_min = Date.new(t.year - max, t.month, t.day)
    birthdate_max = Date.new(t.year - min, t.month, t.day)

    deterministically_verify -> { @tester.birthday(min_age: min, max_age: max) }, depth: 5 do |birthday|
      assert_operator birthday, :>=, birthdate_min, "Expect >= \"#{birthdate_min}\", but got #{birthday}"
      assert_operator birthday, :<=, birthdate_max, "Expect <= \"#{birthdate_max}\", but got #{birthday}"
    end
  end

  def test_birthday_when_min_age_equals_max_age
    min = 0
    max = 0

    birthday = @tester.birthday(min_age: min, max_age: max)

    assert_equal birthday, Date.today
  end

  def test_birthday_on_newborns
    min = 0
    max = 4

    t = Date.today
    birthdate_min = Date.new(t.year - max, t.month, t.day)
    birthdate_max = Date.new(t.year - min, t.month, t.day)

    birthdays = []

    10.times do
      birthday = @tester.birthday(min_age: min, max_age: max)

      birthdays << birthday

      assert_operator birthday, :>=, birthdate_min, "Expect >= \"#{birthdate_min}\", but got #{birthday}"
      assert_operator birthday, :<=, birthdate_max, "Expect <= \"#{birthdate_max}\", but got #{birthday}"
    end

    assert_operator birthdays.uniq.size, :>, 1
  end

  def test_default_birthday
    min = 10
    max = 65

    t = Date.today
    birthdate_min = Date.new(t.year - max, t.month, t.day)
    birthdate_max = Date.new(t.year - min, t.month, t.day)

    deterministically_verify -> { @tester.birthday }, depth: 5 do |birthday|
      assert_operator birthday, :>=, birthdate_min, "Expect >= \"#{birthdate_min}\", but got #{birthday}"
      assert_operator birthday, :<, birthdate_max, "Expect < \"#{birthdate_max}\", but got #{birthday}"
    end
  end

  def test_default_in_date_period
    current_year = Date.today.year

    deterministically_verify -> { @tester.in_date_period } do |date|
      assert_equal date.year, current_year
    end
  end

  def test_in_date_period_with_year
    year = 2015

    deterministically_verify -> { @tester.in_date_period(year: year) } do |date|
      assert_equal date.year, year
    end
  end

  def test_in_date_period_with_month
    month = 2
    current_year = Date.today.year

    deterministically_verify -> { @tester.in_date_period(month: month) } do |date|
      assert_equal date.month, month
      assert_equal date.year, current_year
    end
  end

  def test_in_date_period_date
    year = 2008
    month = 3

    deterministically_verify -> { @tester.in_date_period(year: year, month: month) } do |date|
      assert_equal date.month, month
      assert_equal date.year, year
    end
  end

  def test_on_day_of_week_between
    days = %i[tuesday saturday]
    from = Date.parse('2012-01-01')
    to   = Date.parse('2012-02-01')

    deterministically_verify -> { @tester.on_day_of_week_between(day: days, from: from, to: to) } do |date|
      assert_operator date, :>=, from, "Expected >= \"#{from}\", but got #{date}"
      assert_operator date, :<=, to, "Expected <= \"#{to}\", but got #{date}"
      assert date.tuesday? || date.saturday?, "Expected #{date} to be Tuesday or Saturday, but was #{Faker::Date::DAYS_OF_WEEK[date.wday].capitalize}"
    end
  end

  def test_unknown_day_of_week
    error = assert_raise ArgumentError do
      @tester.on_day_of_week_between(day: :unknown, from: '2012-01-01', to: '2013-01-01')
    end

    assert_equal 'unknown is not a valid day of the week', error.message
  end

  def test_empty_day_of_week
    error = assert_raise ArgumentError do
      @tester.on_day_of_week_between(day: [], from: '2012-01-01', to: '2013-01-01')
    end

    assert_equal 'Day of week cannot be empty', error.message
  end

  def test_day_of_week_outside_date_range
    error = assert_raise ArgumentError do
      @tester.on_day_of_week_between(day: :friday, from: '2012-01-01', to: '2012-01-03')
    end

    assert_equal 'There is no Friday between 2012-01-01 and 2012-01-03. Increase the from/to date range or choose a different day of the week.',
                 error.message
  end
end
