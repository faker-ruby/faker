require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestEsLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = "pt"
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_pl_phone_number
    assert_match /^(\+351)?[\(\)\d\s\-]+$/, Faker::PhoneNumber.phone_number
  end

  def test_pl_building_number
    assert_match /^[\d]{3,5}$/, Faker::Address.building_number
  end

  def test_pl_post_code
    assert_match /^[\d]{4}$/, Faker::Address.postcode
  end

  def test_pl_secondary_address
    assert_match /^[[:word:]]+[\.]? \d{1,3}$/, Faker::Address.secondary_address
  end
end
