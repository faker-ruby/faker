# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHowToTrainYourDragon < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::HowToTrainYourDragon
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end

  def test_dragon
    assert @tester.dragon.match(/\w+/)
  end
end
