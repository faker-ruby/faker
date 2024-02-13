# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsTheExpanse < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::TheExpanse
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

  def test_ship
    assert_match(/\w+/, @tester.ship)
  end
end
