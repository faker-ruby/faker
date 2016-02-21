require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestSVLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'sv'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_sv_names
    assert Faker::Name.name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.first_name_men.is_a? String
    assert Faker::Name.first_name_women.is_a? String
    assert Faker::Name.last_name.is_a? String
  end
  
  def test_sv_phone_number
    assert_match /07[036]{1}[\-\s]?\d{3}[\-\s]?\d{4}/, Faker::PhoneNumber.cell_phone
    assert_match /\d{4}[\s\-]?\d{4,6}/, Faker::PhoneNumber.phone_number
  end

  def test_sv_building_number
    assert_match /^[\d]{1,3}$/, Faker::Address.building_number
  end

  def test_sv_post_code 
    assert_match /^[\d]{5}$/, Faker::Address.postcode
  end
end
