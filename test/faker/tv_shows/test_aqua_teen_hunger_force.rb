# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsAquaTeenHungerForce < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::AquaTeenHungerForce
  end

  def test_character
    assert_match @tester.character, /\w/
  end

  def test_quote
    assert_match @tester.quote, /\w/
  end
end
