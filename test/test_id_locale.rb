# frozen_string_literal: true

require_relative 'test_helper'

class TestIdLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'id'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_id_address_methods
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.province
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.street_address
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.city_name
    assert_kind_of String, Faker::Address.state_abbr
    assert_kind_of String, Faker::Address.street_prefix
    assert_kind_of String, Faker::Address.street_title
    assert_kind_of String, Faker::Address.street_name
  end

  def test_id_provinces
    provinces = I18n.translate('faker.address.province', locale: :id)

    assert_equal 38, provinces.size
    assert_includes provinces, 'Papua Barat Daya'
    assert_includes provinces, 'Papua Pegunungan'
    assert_includes provinces, 'Papua Selatan'
    assert_includes provinces, 'Papua Tengah'
  end

  def test_id_state_abbr_includes_new_provinces
    abbreviations = I18n.translate('faker.address.state_abbr', locale: :id)

    %w[PD PE PS PT].each { |code| assert_includes abbreviations, code }
  end

  def test_id_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.name_with_middle
  end

  def test_id_phone_number_methods
    assert_kind_of String, Faker::PhoneNumber.phone_number
  end
end
