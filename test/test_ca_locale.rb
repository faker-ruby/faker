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
    assert_kind_of String, Faker::Color.color_name
  end

  def test_ca_name_methods
    assert_kind_of String, Faker::Name.female_first_name
    assert_kind_of String, Faker::Name.female_prefix
    assert_kind_of String, Faker::Name.male_first_name
    assert_kind_of String, Faker::Name.male_prefix
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.name_with_middle
  end
end
