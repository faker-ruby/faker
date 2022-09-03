# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTeam < Test::Unit::TestCase
  def setup
    @tester = Faker::Team
  end

  def test_name
    assert_match @tester.name, /(\w+\.? ?){2}/
  end

  def test_creature
    assert_match @tester.creature, /(\w+){1}/
  end

  def test_state
    assert_match @tester.state, /(\w+){1}/
  end

  def test_sport
    assert_match @tester.sport, /(\w+){1}/
  end
end
