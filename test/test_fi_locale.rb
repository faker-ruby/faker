require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TesetEnLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'fi-FI'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_fi_methods
    assert Faker::Name.first_name_women.is_a? String
    assert Faker::Name.first_name_men.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.city.is_a? String
  end

  def test_fi_phone_number
    assert_match /0\d{2}[\-\s]?\d{6}/, Faker::PhoneNumber.cell_phone
    assert_match /\d{2,3}[\s\-]?\d{5,6}/, Faker::PhoneNumber.phone_number
  end

  def test_fi_building_number
    assert_match /^[\d]{1,3}$/, Faker::Address.building_number
  end

  def test_fi_post_code
    assert_match /^[\d]{5}$/, Faker::Address.postcode
  end
end
