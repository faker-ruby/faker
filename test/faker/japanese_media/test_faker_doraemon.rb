# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseMediaDoraemon < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::Doraemon
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_gadget
    assert_match @tester.gadget, /\w+/
  end

  def test_location
    assert_match @tester.location, /\w+/
  end
end
