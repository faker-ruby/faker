# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAustralia < Test::Unit::TestCase
  def setup
    @tester = Faker::Australia
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end

  def test_animal
    assert @tester.animal.match(/\w+/)
  end

  def test_state
    assert @tester.state.match(/\w+/)
  end
end
