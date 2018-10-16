# frozen_string_literal: true

require_relative 'test_helper'

class TestSVLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'sv'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_address_methods
    assert Faker::Address.postcode.match(/^[\d]{5}$/)
  end

  def test_sv_name_methods
    assert Faker::Name.name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
    assert Faker::Name.female_first_name.is_a? String
    assert Faker::Name.male_first_name.is_a? String
  end

  def test_sv_phone_number_methods
    assert Faker::PhoneNumber.cell_phone.match(/^07[036]{1}[\-\s]?\d{3}[\-\s]?\d{4}$/)
    assert Faker::PhoneNumber.phone_number.match(/^\d{4}[\s\-]?\d{4,6}$/)
  end
end
