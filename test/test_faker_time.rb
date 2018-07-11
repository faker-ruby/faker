require_relative 'test_helper'

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
      random_time = @tester.between(from, to)
      assert random_time >= from, "Expected >= \"#{from}\", but got #{random_time}"
      assert random_time <= to, "Expected <= \"#{to}\", but got #{random_time}"
    end
  end

  def test_between_with_date_parameters
    from = Time.at(0).to_date
    to   = Time.at(2_145_945_600).to_date

    100.times do
      random_time = @tester.between(from, to)
      assert random_time.to_date >= from, "Expected >= \"#{from}\", but got #{random_time}"
      assert random_time.to_date <= to, "Expected <= \"#{to}\", but got #{random_time}"
    end
  end

  def test_forward
    today = Date.today

    100.times do
      random_time = @tester.forward(10)
      assert random_time > today.to_time, "Expected > \"#{today}\", but got #{random_time}"
    end
  end

  def test_backward
    tomorrow = Date.today + 1

    100.times do
      random_time = @tester.backward(10)
      assert random_time < tomorrow.to_time, "Expected < \"#{tomorrow}\", but got #{random_time}"
    end
  end

  def test_invalid_period_error
    from = Date.today
    to   = Date.today + 15

    assert_raise ArgumentError do
      @tester.between(from, to, :invalid_period)
    end
  end

  def test_return_type
    random_backward = @tester.backward(5)
    random_between_dates = @tester.between(Date.today, Date.today + 5)
    random_between_times = @tester.between(Time.now, Time.now + TEN_HOURS)
    random_forward = @tester.forward(5)

    [
      random_backward,
      random_between_dates,
      random_between_times,
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

      random_backward = @tester.backward(30, period, format)
      random_between  = @tester.between(from, to, period, format)
      random_forward  = @tester.forward(30, period, format)
      [random_backward, random_between, random_forward].each do |result|
        assert result.is_a?(String), "Expected a String, but got #{result.class}"
        assert_nothing_raised 'Not a valid date string' do
          date_format = '%m/%d/%Y %I:%M %p'
          DateTime.strptime(result, date_format)
        end
      end
    end
  end

  def test_time_period
    from = Time.at(0).to_date
    to   = Time.at(2_145_945_600).to_date

    100.times do
      period          = @time_ranges.keys.to_a.sample
      period_range    = @time_ranges[period]

      random_backward = @tester.backward(30, period)
      random_between  = @tester.between(from, to, period)
      random_forward  = @tester.forward(30, period)

      [random_backward, random_between, random_forward].each_with_index do |result, index|
        assert period_range.include?(result.hour.to_i), "#{%i[random_backward random_between random_forward][index]}: \"#{result}\" expected to be included in Faker::Time::TIME_RANGES[:#{period}] range"
      end
    end

    from = Time.now
    to   = Time.now + 100

    100.times do
      period          = :between
      random_between  = @tester.between(from, to, period)
      assert random_between >= from, "Expected >= \"#{from}\", but got #{random_between}"
      assert random_between <= to, "Expected <= \"#{to}\", but got #{random_between}"
    end
  end
end
