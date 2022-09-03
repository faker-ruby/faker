# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGamesSuperSmashBros < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::SuperSmashBros
  end

  def test_fighter
    assert_match @tester.fighter, /\w+/
  end

  def test_stage
    assert_match @tester.stage, /\w+/
  end
end
