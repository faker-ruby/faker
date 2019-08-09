# frozen_string_literal: true

require_relative 'test_helper'

class TestEnKeLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'en-KE'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_validity_of_phone_number
    validation_regex = /^((0)|(254)|(\+254))((70)|(71)|(72)|(73)|(74)|(75)|(76)|(77)|(78)|(79))\d{7}$/
    assert_match(validation_regex, Faker::PhoneNumber.phone_number.delete(' '))
  end

  def test_validity_of_cell_phone
    validation_regex = /^((0)|(254)|(\+254))((70)|(71)|(72)|(73)|(74)|(75)|(76)|(77)|(78)|(79))\d{7}$/
    assert_match(validation_regex, Faker::PhoneNumber.cell_phone.delete(' '))
  end
end
