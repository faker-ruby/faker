require_relative 'test_helper'

class TestIdLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'id'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_en_sg_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.province.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert Faker::PhoneNumber.phone_number.is_a? String
  end
end
