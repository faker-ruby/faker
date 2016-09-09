require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestEnZaLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'en-ZA'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_en_za_methods
    assert Faker::Internet.domain_suffix.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert Faker::Address.province.is_a? String
    assert Faker::Address.cities.is_a? String
    assert Faker::PhoneNumber.dial_code.is_a? String
    assert Faker::PhoneNumber.exchange_code.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.first_name.is_a? String
  end

  def test_dial_code_length
    assert_equal(Faker::PhoneNumber.dial_code.length, 2)
  end

  def test_exchange_code_length
    assert_equal(Faker::PhoneNumber.exchange_code.length, 3)
  end

  def en_za_cell_phone_countrycode
    mobile = Faker::PhoneNumber.cell_phone.gsub(/\D/,'')
    assert_equal '2', mobile[0]
    assert_equal '7', mobile[1]
  end
end
