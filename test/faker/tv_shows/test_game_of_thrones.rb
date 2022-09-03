# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsGameOfThrones < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::GameOfThrones
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_house
    assert_match @tester.house, /\w+/
  end

  def test_city
    assert_match @tester.city, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end

  def test_dragon
    assert_match @tester.dragon, /\w+/
  end
end
