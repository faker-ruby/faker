# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerStreetFighter < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::StreetFighter
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end
end
