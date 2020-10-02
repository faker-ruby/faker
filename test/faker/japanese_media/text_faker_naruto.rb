# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseNaruto < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::Naruto
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_village
    assert @tester.village.match(/\w+/)
  end

  def test_eye
    assert @tester.eye.match(/\w+/)
  end

  def test_demon
    assert @tester.demon.match(/\w+/)
  end
end
