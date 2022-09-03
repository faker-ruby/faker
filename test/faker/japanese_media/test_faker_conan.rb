# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseConan < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::Conan
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_gadget
    assert_match @tester.gadget, /\w+/
  end

  def test_vehicle
    assert_match @tester.vehicle, /\w+/
  end
end
