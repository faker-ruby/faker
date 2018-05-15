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
    phone = Faker::PhoneNumber.phone_number.gsub(/\D/, '')
    assert_equal '0', phone[0]
  end

  def test_gb_cell_phone_starts_with_zero
    mobile = Faker::PhoneNumber.cell_phone.gsub(/\D/, '')
    assert_equal '0', mobile[0]
  end

  def test_gb_postcode_has_outcode_and_incode
    postcode = Faker::Address.postcode
    assert_equal 2, postcode.split(' ').length
  end

  def test_gb_postcode_incode_is_valid
    # The letters C I K M O V are not used in the second part of the Postcode.
    incode = Faker::Address.postcode.split(' ')[1]
    assert_match(/\d[ABDEFGHJLNPQRSTUWXYZ]{2}/, incode)
  end

  def test_gb_postcode_outcode_is_valid
    outcode = Faker::Address.postcode.split(' ')[0]
    assert_includes(2..4, outcode.length)
    assert_match(/\w{1,2}\d{1,2}\w?/, outcode)
    assert_match(/^[A-PR-UWYZ][A-HK-Y0-9]/, outcode)
    assert_match(/\w{1,2}\d{1,2}|\w\d[ABCDEFGHJKPSTUW]|\w\w\d[ABEHMNPRVWXY]/, outcode)
  end
end
