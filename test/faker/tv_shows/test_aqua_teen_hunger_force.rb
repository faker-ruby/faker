# frozen_string_literal: true

require_relative '../../test_helper'

class Test_Faker_TvShows_AquaTeenHungerForce < Test::Unit::TestCase
  def setup
    @tester = Faker::AquaTeenHungerForce
  end

  def test_character
    assert @tester.character.match(/\w/)
  end
end
