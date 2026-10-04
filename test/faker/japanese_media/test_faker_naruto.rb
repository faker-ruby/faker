# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseNaruto < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::Naruto
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_village
    assert_match(/\w+/, @tester.village)
  end

  def test_eye
    assert_match(/\w+/, @tester.eye)
  end

  def test_demon
    assert_match(/\w+/, @tester.demon)
  end
end
