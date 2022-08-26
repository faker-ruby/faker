# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerVehiclesCar < Test::Unit::TestCase
  def setup
    @tester = Faker::Vehicles::Car
  end

  def test_brand
    assert @tester.brand.match(/\w+/)
  end

  def test_model
    assert @tester.model.match(/\w+/)
  end

  def test_version
    assert @tester.version.match(/\w+/)
  end
end
