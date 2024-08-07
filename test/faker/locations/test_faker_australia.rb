# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerLocationsAustralia < Test::Unit::TestCase
  def test_location
    assert_match(/\w+/, Faker::Locations::Australia.location)
  end

  def test_animal
    assert_match(/\w+/, Faker::Locations::Australia.animal)
  end

  def test_state
    assert_match(/\w+/, Faker::Locations::Australia.state)
  end
end

class TestFakerAustralia < Test::Unit::TestCase
  def setup
    Faker::Deprecator.skip_warning do
      @tester = Faker::Australia
    end
  end

  def test_deprecated_location
    assert_match(/\w+/, @tester.location)
  end

  def test_deprecated_animal
    assert_match(/\w+/, @tester.animal)
  end

  def test_state
    assert_match(/\w+/, @tester.state)
  end
end
