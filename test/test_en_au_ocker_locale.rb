require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestEnAuOckerLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'en-au-ocker'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_au_ocker_methods_with_en_au_ocker_locale
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.ocker_first_name.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.city.is_a? String
  end

  def test_aussie_mobiles_start_with_04
    mobile = Faker::PhoneNumber.cell_phone.gsub(/\D/,'')
    assert_equal '0', mobile[0]
    assert_equal '4', mobile[1]
  end
end
