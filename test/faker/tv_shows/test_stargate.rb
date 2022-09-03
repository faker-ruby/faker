# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsStargate < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Stargate
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_planet
    assert_match @tester.planet, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end
end
