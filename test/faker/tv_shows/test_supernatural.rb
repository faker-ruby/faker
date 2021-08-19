# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsSupernatural < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Supernatural
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_creature
    assert @tester.creature.match(/\w+/)
  end

  def test_weapon
    assert @tester.weapon.match(/\w+/)
  end
end
