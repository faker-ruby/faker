# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseMediaDoraemon < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::Doraemon
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_gadget
    assert @tester.gadget.match(/\w+/)
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end
end
