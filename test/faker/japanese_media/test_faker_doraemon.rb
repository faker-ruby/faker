# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseMediaDoraemon < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::Doraemon
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_sea
    assert @tester.gadget.match(/\w+/)
  end

end
