# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTime < Test::Unit::TestCase
  TEN_HOURS = 36_000

  def setup
    @tester      = Faker::Time
    @time_ranges = Faker::Time::TIME_RANGES
  end

  def test_between_with_time_parameters
    from = Time.at(0)
    to   = Time.at(2_145_945_600)

    100.times do
      random_time = @tester.between(from: from, to: to)
      assert random_time >= from, "Expected >= \"#{from}\", but got #{random_time}"
      assert random_time <= to, "Expected <= \"#{to}\", but got #{random_time}"
    end
  end

  def test_between_with_date_parameters
    from = Time.at(0).to_date
    to   = Time.at(2_145_945_600).to_date

    100.times do
      random_time = @tester.between(from: from, to: to)
      assert random_time.to_date >= from, "Expected >= \"#{from}\", but got #{random_time}"
      assert random_time.to_date <= to, "Expected <= \"#{to}\", but got #{random_time}"
    end
  end

  def test_forward
    today = Date.today

    100.times do
      random_time = @tester.forward(days: 10)
      assert random_time > today.to_time, "Expected > \"#{today}\", but got #{random_time}"
    end
  end

  def test_backward
    tomorrow = Date.today + 1

    100.times do
      random_time = @tester.backward(days: 10)
      assert random_time < tomorrow.to_time, "Expected < \"#{tomorrow}\", but got #{random_time}"
    end
  end

  def test_invalid_period_error
    from = Date.today
    to   = Date.today + 15

    assert_raise ArgumentError do
      @tester.between_dates(from, to, :invalid_period)
    end
  end

  def test_return_types_are_time_objects
    random_backward = @tester.backward(days: 5)
    random_between_dates = @tester.between_dates(from: Date.today, to: Date.today + 5)
    random_between_with_date_args = @tester.between(from: Date.today, to: Date.today + 5)
    random_between_with_time_args = @tester.between(from: Time.now, to: Time.now + TEN_HOURS)
    random_forward = @tester.forward(days: 5)

    [
      random_backward,
      random_between_dates,
      random_between_with_date_args,
      random_between_with_time_args,
      random_forward
    ].each do |result|
      assert result.is_a?(Time), "Expected a Time object, but got #{result.class}"
    end
  end

  def test_format
    from = Date.today
    to   = Date.today + 15
    format = :us
    100.times do
      period = @time_ranges.keys.to_a.sample

      random_between_dates = @tester.between_dates(from: from, to: to, period: period, format: format)
      random_backward = @tester.backward(days: 30, period: period, format: format)
      random_between  = @tester.between(from: from, to: to, format: format)
      random_forward  = @tester.forward(days: 30, period: period, format: format)

      [random_backward, random_between, random_between_dates, random_forward].each do |result|
        assert result.is_a?(String), "Expected a String, but got #{result.class}"
        assert_nothing_raised 'Not a valid date string' do
          date_format = '%m/%d/%Y %I:%M %p'
          DateTime.strptime(result, date_format)
        end
      end
    end
  end

  def test_time_period
    # These dates are chosen to avoid any conflict with DST. When period is not strictly respected.
    from = Date.parse('2018-09-01')
    to   = Date.parse('2018-09-15')

    100.times do
      period          = @time_ranges.keys.to_a.sample
      period_range    = @time_ranges[period]

      random_backward = @tester.backward(days: 30, period: period)
      random_between  = @tester.between_dates(from: from, to: to, period: period)
      random_forward  = @tester.forward(days: 30, period: period)

      [random_backward, random_between, random_forward].each_with_index do |result, index|
        assert period_range.include?(result.hour.to_i), "#{%i[random_backward random_between random_forward][index]}: \"#{result}\" expected to be included in Faker::Time::TIME_RANGES[:#{period}] range"
      end
    end
  end

  def test_between_in_short_window
    # This test intentionally specifies a small window, because previous versions of between's
    # default behavior would only constrain the date range, while allowing the time range to
    # wander.
    from = Time.utc(2018, 'jun', 12, 16, 14, 44)
    to   = Time.utc(2018, 'jun', 12, 16, 19, 52)

    100.times do
      random_between = @tester.between(from: from, to: to)
      assert random_between >= from, "Expected >= \"#{from}\", but got #{random_between}"
      assert random_between <= to, "Expected <= \"#{to}\", but got #{random_between}"
    end
  end
end
