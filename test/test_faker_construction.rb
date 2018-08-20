# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerConstruction < Test::Unit::TestCase
  def setup
    Faker::Config.locale = nil
  end

  def test_materials
    10.times { assert Faker::Construction.materials.match(/[\w]+/) }
  end

  def test_locales
    [nil, 'en'].each do |locale_name|
      Faker::Config.locale = locale_name
      assert Faker::Construction.materials.is_a? String
    end
  end
end
