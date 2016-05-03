require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerTimeCode < Test::Unit::TestCase
  TWENTYFOUR_HOURS = 86400

  def setup
    @tester      = Faker::TimeCode
    @timecode_ranges = Faker::TimeCode::TIMECODE_RANGES
  end

  def test_between_with_timecode_parameters
    from = TimeCode.at(0)
    to   = TimeCode.at(86400)

    100.times do
      random_timecode = @tester.between(from, to)
      assert random_timecode >= from, "Expected >= \"#{from}\", but got #{random_timecode}"
      assert random_timecode <= to  , "Expected <= \"#{to}\", but got #{random_timecode}"
    end
  end

  def test_forward
    hour = TimeCode.hour
    100.times do
      random_time = @tester.forward(10)
      assert random_timecode > today.to_time, "Expected > \"#{hour - 1}\", but got #{random_timecode}"
    end
  end

  def test_backward
    hour = TimeCode.hour + 1
    100.times do
      random_timecode = @tester.backward(10)
      assert random_timecode < hour.to_time, "Expected < \"#{hour + 1}\", but got #{random_timecode}"
    end
  end

  def test_invalid_period_error
    from = TimeCode.hour
    to   = TimeCode.hour + 23
    assert_raise ArgumentError do
      @tester.between(from, to, :invalid_period)
    end
  end

end
