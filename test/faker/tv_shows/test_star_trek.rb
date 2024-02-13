# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsStarTrek < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::StarTrek
  end

  def test_characters
    assert_match(/\w+/, @tester.character)
  end

  def test_locations
    assert_match(/\w+/, @tester.location)
  end

  def test_species
    assert_match(/\w+/, @tester.specie)
  end

  def test_villains
    assert_match(/\w+/, @tester.villain)
  end
end
