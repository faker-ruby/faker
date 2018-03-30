require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestCaCatLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'ca-CAT'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_ca_methods
    assert Faker::Address.city.is_a? String
    assert Faker::Address.country.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.street_suffix.is_a? String
    assert Faker::Address.secondary_address.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.province.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert Faker::Address.default_country.is_a? String
  end

  def test_phone_numbers_start_with_9
    mobile = Faker::PhoneNumber.phone_number.gsub(/\D/,'')
    assert_equal '9', mobile[0]
  end

  def test_cell_numbers_start_with_6
    mobile = Faker::PhoneNumber.cell_phone.gsub(/\D/,'')
    assert_equal '6', mobile[0]
  end
end
