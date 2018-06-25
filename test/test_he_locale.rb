require_relative 'test_helper'

class TestHeLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'he'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_he_methods
    assert Faker::Address.city_prefix.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_prefix.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
  end
end
