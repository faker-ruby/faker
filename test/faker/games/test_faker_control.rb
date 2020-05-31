# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGameControl < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Control
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end

  def test_object_of_power
    assert @tester.object_of_power.match(/\w+/)
  end

  def test_altered_item
    assert @tester.altered_item.match(/\w+/)
  end

  def test_altered_world_event
    assert @tester.altered_world_event.match(/\w+/)
  end

  def test_hiss
    assert @tester.hiss.match(/\w+/)
  end

  def test_the_board
    assert @tester.the_board.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
