require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerTime < Test::Unit::TestCase
  def setup
    @tester      = Faker::Time
    @time_ranges = Faker::Time::TIME_RANGES
  end

  def test_between
    from = Time.local(2012, 01, 01,  0,  0,  0)
    to   = Time.local(2013, 01, 01, 23, 59, 59)

    100.times do
      random_time = @tester.between(from, to)
      assert random_time >= from, "Expected >= \"#{from}\", but got #{random_time}"
      assert random_time <= to  , "Expected <= \"#{to}\", but got #{random_time}"
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
    random_between  = @tester.between(Date.today, Date.today + 5)
    random_forward  = @tester.forward(5)

    [random_backward, random_between, random_forward].each do |result|
      assert result.is_a?(Time), "Expected a Time object, but got #{result.class}"
    end
  end

  def test_time_period
    from = Date.today
    to   = Date.today + 15

    100.times do
      period          = @time_ranges.keys.to_a.sample
      period_range    = @time_ranges[period]

      random_backward = @tester.backward(30, period)
      random_between  = @tester.between(from, to, period)
      random_forward  = @tester.forward(30, period)

      [random_backward, random_between, random_forward].each do |result|
        assert period_range.include?(result.hour.to_i), "\"#{result.hour}\" expected to be included in Faker::Time::TIME_RANGES[:#{period}] range"
      end
    end
  end
end
