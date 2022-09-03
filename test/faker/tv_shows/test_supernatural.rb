# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsSupernatural < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Supernatural
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_creature
    assert_match @tester.creature, /\w+/
  end

  def test_weapon
    assert_match @tester.weapon, /\w+/
  end
end
