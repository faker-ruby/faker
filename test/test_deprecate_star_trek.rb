# frozen_string_literal: true

require_relative 'test_helper'

class TestDeprecateStarTrek < Test::Unit::TestCase
  def setup
    @tester = Faker::StarTrek
  end

  def test_characters
    assert @tester.character.match(/\w+/)
  end

  def test_locations
    assert @tester.location.match(/\w+/)
  end

  def test_species
    assert @tester.specie.match(/\w+/)
  end

  def test_villains
    assert @tester.villain.match(/\w+/)
  end
end
