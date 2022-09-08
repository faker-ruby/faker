# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerStreetFighter < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::StreetFighter
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_stage
    assert_match(/\w+/, @tester.stage)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end

  def test_move
    assert_match(/\w+/, @tester.move)
  end
end
