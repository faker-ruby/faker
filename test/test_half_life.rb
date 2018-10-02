# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerHalfLife < Test::Unit::TestCase
  def setup
    @tester = Faker::HalfLife
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_enemy
    assert @tester.enemy.match(/\w+/)
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end
end
