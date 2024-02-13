# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseMediaDoraemon < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::Doraemon
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_gadget
    assert_match(/\w+/, @tester.gadget)
  end

  def test_location
    assert_match(/\w+/, @tester.location)
  end
end
