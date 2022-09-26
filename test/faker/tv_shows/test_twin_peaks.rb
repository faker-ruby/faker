# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsTwinPeaks < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::TwinPeaks
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_location
    assert_match(/\w+/, @tester.location)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end
end
