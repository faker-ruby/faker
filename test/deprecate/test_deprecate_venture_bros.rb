# frozen_string_literal: true

require_relative '../test_helper'

class TestDeprecateVentureBros < Test::Unit::TestCase
  def setup
    @tester = Faker::VentureBros
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_vehicle
    assert @tester.vehicle.match(/\w+/)
  end

  def test_organization
    assert @tester.organization.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
