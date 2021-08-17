# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerStreetFighter < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::StreetFighter
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_stage
    assert @tester.stage.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end

  def test_move
    assert @tester.move.match(/\w+/)
  end
end
