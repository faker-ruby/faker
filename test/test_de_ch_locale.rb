# frozen_string_literal: true

require_relative 'test_helper'

class TestDeChLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'de-CH'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_de_ch_address_methods
    assert_kind_of String, Faker::Address.country_code
    assert_kind_of String, Faker::Address.default_country
    assert_kind_of String, Faker::Address.postcode
    assert_equal('Schweiz', Faker::Address.default_country)
  end

  def test_de_ch_company_methods
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of String, Faker::Company.name
  end

  def test_de_ch_internet_methods
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_de_ch_mountain_methods
    assert_kind_of String, Faker::Mountain.name
  end

  def test_de_ch_job_methods
    assert_kind_of String, Faker::Job.title
    assert_kind_of String, Faker::Job.field
    assert_kind_of String, Faker::Job.position
    assert_kind_of String, Faker::Job.key_skill

    # Guard against Faker::Job silently falling back to the English data.
    fields = I18n.translate('faker.job.field', locale: :'de-CH')

    assert_includes fields, Faker::Job.field
  end
end
