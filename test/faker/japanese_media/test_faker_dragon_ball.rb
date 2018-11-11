# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseMediaDragonBall < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::DragonBall
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end
end
