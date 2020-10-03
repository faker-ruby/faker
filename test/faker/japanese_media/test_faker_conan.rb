# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseConan < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::Conan
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_gadget
    assert @tester.gadget.match(/\w+/)
  end

  def test_vehicle
    assert @tester.vehicle.match(/\w+/)
  end
end
