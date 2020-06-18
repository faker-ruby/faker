# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHouse < Test::Unit::TestCase
  def setup
    @tester = Faker::House
  end

  def test_furniture
    assert @tester.furniture.match?(/\w+/)
  end

  def test_room
    assert @tester.room.match?(/\w+/)
  end
end
