require_relative 'test_helper'

class TestItLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'it'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_it_methods
    assert Faker::Address.city_prefix.is_a? String
    assert Faker::Address.city_suffix.is_a? String
    assert Faker::Address.country.is_a? String
    assert Faker::Address.street_suffix.is_a? String
    assert Faker::Address.secondary_address.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.buzzwords.is_a? Array
    assert Faker::Company.bs.is_a? String
    assert Faker::Company.name.is_a? String
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
  end

  def test_it_prefix_dot
    assert_equal('.', Faker::Name.prefix[-1, 1])
  end

  def test_it_default_country
    assert_equal('Italia', Faker::Address.default_country)
  end
end
