require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestEnNzLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'en-NZ'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_nz_methods_with_en_nz_locale
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.city.is_a? String
  end

  def test_nz_cellphones_start_with_02
    cellphone = Faker::PhoneNumber.cell_phone.gsub(/\D/,'')
    assert_equal '0', cellphone[0]
    assert_equal '2', cellphone[1]
  end

  def test_nz_is_default_country
    assert_equal 'New Zealand', Faker::Address.default_country
  end

  def test_regions_with_en_nz_locale
    assert Faker::Address.region.is_a? String
    assert Faker::Address.region_abbr.is_a? String
  end
end