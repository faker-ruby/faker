# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsStarTrek < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::StarTrek
  end

  def test_characters
    assert_match @tester.character, /\w+/
  end

  def test_locations
    assert_match @tester.location, /\w+/
  end

  def test_species
    assert_match @tester.specie, /\w+/
  end

  def test_villains
    assert_match @tester.villain, /\w+/
  end
end
