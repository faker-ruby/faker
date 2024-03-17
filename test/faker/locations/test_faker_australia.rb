# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerLocationsAustralia < Test::Unit::TestCase
  def setup
    @tester = Faker::Locations::Australia
  end

  def test_location
    assert_match(/\w+/, @tester.location)
  end

  def test_animal
    assert_match(/\w+/, @tester.animal)
  end

  def test_state
    assert_match(/\w+/, @tester.state)
  end
end

class TestFakerAustralia < Test::Unit::TestCase
  def setup
    @tester = Faker::Australia
  end

  def test_location
    assert_match(/\w+/, @tester.location)
  end

  def test_animal
    assert_match(/\w+/, @tester.animal)
  end

  def test_state
    assert_match(/\w+/, @tester.state)
  end
end
