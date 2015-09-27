require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestEnUgLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'en-UG'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_validity_of_phone_number
    validation_regex = /^((0)|(256)|(\+256))((39)|(41))\d{7}$/
    assert_match(validation_regex, Faker::PhoneNumber.phone_number.gsub(' ',''))
  end

  def test_validity_of_cell_phone
    validation_regex = /^((0)|(256)|(\+256))((70)|(71)|(72)|(74)|(75)|(77)|(78)|(79))\d{7}$/
    assert_match(validation_regex, Faker::PhoneNumber.cell_phone.gsub(' ',''))
  end

end