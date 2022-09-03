# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseNaruto < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::Naruto
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_village
    assert_match @tester.village, /\w+/
  end

  def test_eye
    assert_match @tester.eye, /\w+/
  end

  def test_demon
    assert_match @tester.demon, /\w+/
  end
end
