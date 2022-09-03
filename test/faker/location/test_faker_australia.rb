# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAustralia < Test::Unit::TestCase
  def setup
    @tester = Faker::Australia
  end

  def test_location
    assert_match @tester.location, /\w+/
  end

  def test_animal
    assert_match @tester.animal, /\w+/
  end

  def test_state
    assert_match @tester.state, /\w+/
  end
end
