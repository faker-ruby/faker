# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTeam < Test::Unit::TestCase
  def setup
    @tester = Faker::Team
  end

  def test_name
    assert_match(/(\w+\.? ?){2}/, @tester.name)
  end

  def test_creature
    assert_match(/(\w+){1}/, @tester.creature)
  end

  def test_state
    assert_match(/(\w+){1}/, @tester.state)
  end

  def test_sport
    assert_match(/(\w+){1}/, @tester.sport)
  end
end
