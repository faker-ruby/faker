# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsTheExpanse < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::TheExpanse
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

  def test_ship
    assert_match @tester.ship, /\w+/
  end
end
