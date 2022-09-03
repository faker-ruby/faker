# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHowToTrainYourDragon < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::HowToTrainYourDragon
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_location
    assert_match @tester.location, /\w+/
  end

  def test_dragon
    assert_match @tester.dragon, /\w+/
  end
end
