# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGameControl < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Control
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_location
    assert_match @tester.location, /\w+/
  end

  def test_object_of_power
    assert_match @tester.object_of_power, /\w+/
  end

  def test_altered_item
    assert_match @tester.altered_item, /\w+/
  end

  def test_altered_world_event
    assert_match @tester.altered_world_event, /\w+/
  end

  def test_hiss
    assert_match @tester.hiss, /\w+/
  end

  def test_the_board
    assert_match @tester.the_board, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end
end
