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
