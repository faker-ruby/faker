# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsStargate < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Stargate
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_planet
    assert_match(/\w+/, @tester.planet)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end
end
