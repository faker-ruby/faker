# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsGameOfThrones < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::GameOfThrones
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_house
    assert_match(/\w+/, @tester.house)
  end

  def test_city
    assert_match(/\w+/, @tester.city)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end

  def test_dragon
    assert_match(/\w+/, @tester.dragon)
  end
end
