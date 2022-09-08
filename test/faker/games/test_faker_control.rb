# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGameControl < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Control
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_location
    assert_match(/\w+/, @tester.location)
  end

  def test_object_of_power
    assert_match(/\w+/, @tester.object_of_power)
  end

  def test_altered_item
    assert_match(/\w+/, @tester.altered_item)
  end

  def test_altered_world_event
    assert_match(/\w+/, @tester.altered_world_event)
  end

  def test_hiss
    assert_match(/\w+/, @tester.hiss)
  end

  def test_the_board
    assert_match(/\w+/, @tester.the_board)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end
end
