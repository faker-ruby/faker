# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerConstruction < Test::Unit::TestCase
  def setup
    Faker::Config.locale = nil
  end

  def test_material
    assert Faker::Construction.material.match(/[\w]+/)
  end

  def test_subcontract_category
    assert Faker::Construction.material.match(/[\w]+/)
  end

  def test_locales
    [nil, 'en'].each do |locale_name|
      Faker::Config.locale = locale_name
      assert Faker::Construction.material.is_a? String
      assert Faker::Construction.subcontract_category.is_a? String
    end
  end
end
