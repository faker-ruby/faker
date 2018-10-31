# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerGamesSuperSmashBros < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::SuperSmashBros
  end

  def test_fighter
    assert @tester.fighter.match(/\w+/)
  end

  def test_stage
    assert @tester.stage.match(/\w+/)
  end
end
