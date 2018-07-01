require_relative 'test_helper'

class TestEsMxLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'es-MX'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_es_mx_address
    assert Faker::Address.street_prefix.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
  end

  def test_es_mx_address_city
    assert Faker::Address.city_prefix.empty?
    assert Faker::Address.city_suffix.empty?
    assert Faker::Address.city.is_a?(String)
    assert Faker::Address.city(with_state: true).is_a?(String)
    assert Faker::Address.city(with_state: true).split(', ').count == 2
  end

  def test_es_mx_address_secondary
    assert Faker::Address.secondary_address.is_a? String
  end

  def test_es_mx_methods
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.prefix.is_a? String
    assert Faker::Company.name.is_a? String
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
    assert Faker::University.suffix.is_a? String
    assert Faker::University.prefix.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.name.is_a? String
  end
end
