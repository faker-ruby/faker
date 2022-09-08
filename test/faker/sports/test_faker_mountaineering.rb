# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMountaineering < Test::Unit::TestCase
  def setup
    @tester = Faker::Sports::Mountaineering
  end

  def test_mountaineer
    assert_match(/\w+/, @tester.mountaineer)
  end
end
