# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHouse < Test::Unit::TestCase
  def setup
    @tester = Faker::House
  end

  def test_furniture
    assert_match @tester.furniture, /\w+/
  end

  def test_room
    assert_match @tester.room, /\w+/
  end
end
