require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerTimeCode < Test::Unit::TestCase
  TWENTYFOUR_HOURS = 86400

  def setup
    @tester = Faker::TimeCode
    @timecode_ranges = Faker::TimeCode::TIMECODE_RANGES
  end

  def test_between_with_timecode_parameters
    from = Time.at(0)
    to   = Time.at(86400)

    100.times do
      random_timecode = @tester.between(from, to)
      assert random_timecode >= from, "Expected >= \"#{from}\", but got #{random_timecode}"
      assert random_timecode <= to  , "Expected <= \"#{to}\", but got #{random_timecode}"
    end
  end


  def test_invalid_period_error
    from = Time.hour
    to   = Time.hour + 23
    assert_raise ArgumentError do
      @tester.between(from, to, :invalid_period)
    end
  end

end
