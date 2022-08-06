# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMountaineering < Test::Unit::TestCase
  def setup
    @tester = Faker::Sports::Mountaineering
  end

  def test_mountaineer
    assert @tester.mountaineer.match(/\w+/)
  end
end
