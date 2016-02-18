require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestDaDkLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'da-DK'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_da_dk_names
    assert Faker::Name.name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.city.is_a? String
  end

  def test_da_dk_phone_number
    assert_match /(20)|(30)|(40)[\d\s]+$/, Faker::PhoneNumber.cell_phone
    assert_match /(\d\d[\s\-]?){4}$/, Faker::PhoneNumber.phone_number
  end

  def test_da_dk_postal_code
    assert_match /[\d]{4}$/, Faker::Address.postcode
  end

  def test_da_dk_building_number
    assert_match /[\d]{1,3}$/, Faker::Address.building_number
  end
end
