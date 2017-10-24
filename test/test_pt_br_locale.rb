require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestPtBrLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'pt-BR'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_pl_phone_number
    assert_match /^(\+351)?[\(\)\d\s\-]+$/, Faker::PhoneNumber.phone_number
  end

  def test_pl_building_number
    assert_match /^[\d]{3,5}$|^s\/n$/, Faker::Address.building_number
  end

  def test_pl_post_code
    assert_match /^[\d]{5}-[\d]{3}$/, Faker::Address.postcode
  end

  def test_pl_secondary_address
    assert_match /^[[:word:]]+[\.]? \d{1,3}$/, Faker::Address.secondary_address
  end

  def test_validity_of_msisdn_method_output
    assert_match(/^[\d]{11}$/, Faker::PhoneNumber.msisdn)
  end
end
