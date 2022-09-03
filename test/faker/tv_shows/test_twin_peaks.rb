# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsTwinPeaks < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::TwinPeaks
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_location
    assert_match @tester.location, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end
end
