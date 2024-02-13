# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGamesSuperSmashBros < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::SuperSmashBros
  end

  def test_fighter
    assert_match(/\w+/, @tester.fighter)
  end

  def test_stage
    assert_match(/\w+/, @tester.stage)
  end
end
