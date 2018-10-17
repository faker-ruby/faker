# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerAquaTeenHungerForce < Test::Unit::TestCase
  def setup
    @tester = Faker::TV::AquaTeenHungerForce
  end

  def test_character
    assert @tester.character.match(/\w/)
  end
end
