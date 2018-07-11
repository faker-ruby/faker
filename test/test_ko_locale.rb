require_relative 'test_helper'

class TestKoLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'ko'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_ko_methods
    assert Faker::Address.postcode.is_a? String
    assert_equal(5, Faker::Address.postcode.length)
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.city_suffix.is_a? String
    assert Faker::Address.city_name.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.prefix.is_a? String
    assert Faker::Company.name.is_a? String
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
    assert Faker::Lorem.words.is_a? Array
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.name.is_a? String
  end
end
