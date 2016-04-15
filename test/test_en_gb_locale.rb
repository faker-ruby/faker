require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestEnGbLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'en-GB'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_en_gb_methods
    assert Faker::Address.county.is_a? String
    assert Faker::Address.uk_country.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_gb_phone_starts_with_zero
    phone = Faker::PhoneNumber.phone_number.gsub(/\D/,'')
    assert_equal '0', phone[0]
  end

  def test_gb_cell_phone_starts_with_zero
    mobile = Faker::PhoneNumber.cell_phone.gsub(/\D/,'')
    assert_equal '0', mobile[0]
  end
end
