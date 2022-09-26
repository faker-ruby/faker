# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHowToTrainYourDragon < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::HowToTrainYourDragon
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_location
    assert_match(/\w+/, @tester.location)
  end

  def test_dragon
    assert_match(/\w+/, @tester.dragon)
  end
end
