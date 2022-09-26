# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerConstruction < Test::Unit::TestCase
  def setup
    Faker::Config.locale = nil
  end

  def test_material
    assert_match(/\w+/, Faker::Construction.material)
  end

  def test_heavy_equipment
    assert_match(/\w+/, Faker::Construction.heavy_equipment)
  end

  def test_trade
    assert_match(/\w+/, Faker::Construction.trade)
  end

  def test_subcontract_category
    assert_match(/\w+/, Faker::Construction.subcontract_category)
  end

  def test_standard_cost_code
    assert_match(/\w+/, Faker::Construction.standard_cost_code)
  end

  def test_role
    assert_match(/\w+/, Faker::Construction.role)
  end

  def test_locales
    [nil, 'en'].each do |locale_name|
      Faker::Config.locale = locale_name
      assert Faker::Construction.material.is_a? String
      assert Faker::Construction.subcontract_category.is_a? String
      assert Faker::Construction.standard_cost_code.is_a? String
      assert Faker::Construction.trade.is_a? String
      assert Faker::Construction.role.is_a? String
      assert Faker::Construction.heavy_equipment.is_a? String
    end
  end
end
