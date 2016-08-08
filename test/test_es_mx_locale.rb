require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestEsMxLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'es-MX'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_es_mx_methods
    assert Faker::Address.city_prefix.is_a? String
    assert Faker::Address.street_prefix.is_a? String
    assert Faker::Address.secondary_address.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
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
