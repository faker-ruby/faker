require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerDateTime < Test::Unit::TestCase
  TEN_HOURS = 36_000

  def setup
    @tester      = Faker::DateTime
    @time_ranges = Faker::DateTime::TIME_RANGES
  end

  def test_between_with_time_parameters
    from = Time.at(0)
    to   = Time.at(2_145_945_600)

    100.times do
      random_time = @tester.between(from, to)
      assert random_time >= from.to_datetime, "Expected >= \"#{from}\", but got #{random_time}"
      assert random_time <= to.to_datetime, "Expected <= \"#{to}\", but got #{random_time}"
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

  def test_invalid_period_error
    from = Date.today
    to   = Date.today + 15

    assert_raise ArgumentError do
      @tester.between(from, to, :invalid_period)
    end
  end

  def test_return_type
    random_between_dates = @tester.between(Date.today, Date.today + 5)
    random_between_times = @tester.between(Time.now, Time.now + TEN_HOURS)

    [
      random_between_dates,
      random_between_times
    ].each do |result|
      assert result.is_a?(DateTime), "Expected a DateTime object, but got #{result.class}"
    end
  end

  def test_format
    from = Date.today
    to   = Date.today + 15
    format = :us
    100.times do
      period = @time_ranges.keys.to_a.sample

      result = @tester.between(from, to, period, format)
      assert result.is_a?(String), "Expected a String, but got #{result.class}"
      assert_nothing_raised 'Not a valid date string' do
        date_format = '%m/%d/%Y %I:%M %p'
        DateTime.strptime(result, date_format)
      end
    end
  end

  def test_time_period
    from = Time.at(0).to_date
    to   = Time.at(2_145_945_600).to_date

    100.times do
      period          = @time_ranges.keys.to_a.sample
      period_range    = @time_ranges[period]

      result = @tester.between(from, to, period)
      assert period_range.include?(result.hour.to_i), "#{result}: \"#{result}\" expected to be included in Faker::Time::TIME_RANGES[:#{period}] range"
    end
  end
end
