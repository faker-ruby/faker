require_relative 'test_helper'

class TestEnNgLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'en-NG'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_au_methods_with_en_au_locale
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.default_country.is_a? String
  end

  def test_ng_is_default_country
    assert_equal 'Nigeria', Faker::Address.default_country
  end

  def test_regions_with_en_ng_locale
    assert Faker::Address.region.is_a? String
  end

  def test_ng_phonenumber_is_11_digits
    phone_number = Faker::PhoneNumber.phone_number
    assert_equal 11, phone_number.length
  end

  def test_ng_phonenumber_starts_with_0
    phone_number = Faker::PhoneNumber.phone_number
    assert_equal '0', phone_number[0]
  end
end
