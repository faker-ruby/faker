# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerStreetFighter < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::StreetFighter
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_stage
    assert_match @tester.stage, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end

  def test_move
    assert_match @tester.move, /\w+/
  end
end
