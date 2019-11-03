# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTennis < Test::Unit::TestCase
  def setup
    @tester = Faker::Sports::Tennis
  end

  def test_grand_slam
    assert @tester.grand_slam.match(/\w+/)
  end

  def test_player
    assert @tester.player.match(/\w+/)
  end
end
