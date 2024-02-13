# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsSupernatural < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Supernatural
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_creature
    assert_match(/\w+/, @tester.creature)
  end

  def test_weapon
    assert_match(/\w+/, @tester.weapon)
  end
end
