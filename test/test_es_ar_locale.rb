# frozen_string_literal: true

require_relative 'test_helper'

class TestEsArLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'es-AR'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_es_ar_name_methods
    assert Faker::Name.male_first_name.is_a? String
    assert Faker::Name.female_first_name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.male_suffix.is_a? String
    assert Faker::Name.female_suffix.is_a? String
    assert Faker::Name.suffix.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
  end
end
