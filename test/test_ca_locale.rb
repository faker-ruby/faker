# frozen_string_literal: true

require_relative 'test_helper'

class TestCaLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'ca'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_ca_color_methods
    assert Faker::Color.name.is_a? String
  end

  def test_ca_name_methods
    assert Faker::Name.female_first_name.is_a? String
    assert Faker::Name.female_prefix.is_a? String
    assert Faker::Name.male_first_name.is_a? String
    assert Faker::Name.male_prefix.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
  end
end
