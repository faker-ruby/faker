# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHouse < Test::Unit::TestCase
  def setup
    @tester = Faker::House
  end

  def test_furniture
    assert_match(/\w+/, @tester.furniture)
  end

  def test_room
    assert_match(/\w+/, @tester.room)
  end
end
