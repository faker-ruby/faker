require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TesetEnUsLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = nil
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_us_phone_methods_return_nil_for_nil_locale
    assert_nil Faker::PhoneNumber.area_code
    assert_nil Faker::PhoneNumber.exchange_code
  end

  def test_subscriber_number_method
    assert Faker::PhoneNumber.subscriber_number.is_a? String
    assert_equal Faker::PhoneNumber.subscriber_number.length, 4
    assert_equal Faker::PhoneNumber.subscriber_number(10).length, 10
    assert_equal Faker::PhoneNumber.method(:extension), Faker::PhoneNumber.method(:subscriber_number)
  end

  def test_us_phone_methods_with_en_us_locale
    Faker::Config.locale = 'en-US'

    assert Faker::PhoneNumber.area_code.is_a? String
    assert Faker::PhoneNumber.area_code.to_i.is_a? Integer
    assert_equal Faker::PhoneNumber.area_code.length, 3

    assert Faker::PhoneNumber.exchange_code.is_a? String
    assert Faker::PhoneNumber.exchange_code.to_i.is_a? Integer
    assert_equal Faker::PhoneNumber.exchange_code.length, 3
  end

  def test_validity_of_phone_method_output
    Faker::Config.locale = 'en-US'

    # got the following regex from http://stackoverflow.com/a/123666/1210055 as an expression of the NANP standard.
    us_number_validation_regex = /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/
    assert_match(us_number_validation_regex, Faker::PhoneNumber.phone_number)
  end

  def test_us_invalid_state_raises_exception
    Faker::Config.locale = 'en-US'
    assert_raise I18n::MissingTranslationData do Faker::Address.zip_code('NA') end
  end

  def test_us_zip_codes_match_state

    Faker::Config.locale = 'en-US'

    state_abbr = 'AZ'
    expected = /^850\d\d$/
    assert_match(expected, Faker::Address.zip_code(state_abbr))

    # disjointed ranges for these states
    # http://www.fincen.gov/forms/files/us_state_territory_zip_codes.pdf
    state_abbr = 'AR'
    expected = /^717\d\d$/
    assert_match(expected, Faker::Address.zip_code(state_abbr))
    state_abbr = 'GA'
    expected = /^301\d\d$/
    assert_match(expected, Faker::Address.zip_code(state_abbr))
    state_abbr = 'MA'
    expected = /^026\d\d$/
    assert_match(expected, Faker::Address.zip_code(state_abbr))
    state_abbr = 'NY'
    expected = /^122\d\d$/
    assert_match(expected, Faker::Address.zip_code(state_abbr))
    state_abbr = 'TX'
    expected = /^798\d\d$/
    assert_match(expected, Faker::Address.zip_code(state_abbr))
    state_abbr = 'VA'
    expected = /^222\d\d$/
    assert_match(expected, Faker::Address.zip_code(state_abbr))

  end

  def test_valid_id_number
    id_num = Faker::IDNumber.valid
    assert Faker::IDNumber::INVALID_SSN.none? { |regex| id_num =~ regex }
  end

  def test_invalid_id_number
    id_num = Faker::IDNumber.invalid
    assert Faker::IDNumber::INVALID_SSN.any? { |regex| id_num =~ regex }
  end
end
