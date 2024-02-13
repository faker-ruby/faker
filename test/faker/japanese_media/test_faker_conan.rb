# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseConan < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::Conan
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_gadget
    assert_match(/\w+/, @tester.gadget)
  end

  def test_vehicle
    assert_match(/\w+/, @tester.vehicle)
  end
end
