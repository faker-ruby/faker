# frozen_string_literal: true

require_relative 'test_helper'

LoadedYaml = %w[en en-BORK].each_with_object({}) do |locale, h|
  h[locale] = YAML.load_file(File.expand_path(File.dirname(__FILE__) + "/../lib/locales/#{locale}.yml"))[locale]['faker']
end

class TestLocale < Test::Unit::TestCase
  def teardown
    Faker::Config.locale = nil
  end

  def test_locale_separate_from_i18n
    I18n.locale = :en
    Faker::Config.locale = :de
    assert_match(/\(0\d+\) \d+|\d+-\d+/, Faker::PhoneNumber.phone_number)
    assert_match(//, Faker::Address.street_name)
    Faker::Config.locale = :ru
    assert_match(/([\da-z.-]+)\.([a-z.]{2,6})/, Faker::Internet.domain_name)
  end

  def test_configured_locale_translation
    Faker::Config.locale = 'en-BORK'
    assert_equal Faker::Base.translate('faker.lorem.words').first, LoadedYaml['en-BORK']['lorem']['words'].first
  end

  def test_locale_override_when_calling_translate
    Faker::Config.locale = 'en-BORK'
    assert_equal Faker::Base.translate('faker.separator', locale: :en), LoadedYaml['en']['separator']
  end

  def test_translation_fallback
    Faker::Config.locale = 'en-BORK'
    assert_nil LoadedYaml['en-BORK']['name']
    assert_equal Faker::Base.translate('faker.separator'), LoadedYaml['en']['separator']
  end

  def test_translation_fallback_without_en_in_available_locales
    I18n.available_locales -= [:en]
    Faker::Config.locale = 'en-BORK'
    assert_nil LoadedYaml['en-BORK']['name']
    assert_equal Faker::Base.translate('faker.separator'), LoadedYaml['en']['separator']
  ensure
    I18n.available_locales += [:en]
  end

  def test_with_locale_does_not_fail_without_the_locale_in_available_locales
    I18n.available_locales -= [:en]
    Faker::Base.with_locale(:en) do
      assert_equal Faker::Base.translate('faker.separator'), LoadedYaml['en']['separator']
    end
  ensure
    I18n.available_locales += [:en]
  end

  def test_no_en_in_available_locales
    I18n.available_locales -= [:en]
    assert_kind_of String, Faker::Address.country
  ensure
    I18n.available_locales += [:en]
  end

  def test_with_locale_changes_locale_temporarily
    Faker::Config.locale = 'en-BORK'
    I18n.with_locale(:en) do
      assert_equal Faker::Base.translate('faker.separator'), LoadedYaml['en']['separator']
    end
    assert_equal 'en-BORK', Faker::Config.locale
  end

  def test_regex
    Faker::Config.locale = 'en-GB'
    re = /[A-PR-UWYZ]([A-HK-Y][0-9][ABEHMNPRVWXY0-9]?|[0-9][ABCDEFGHJKPSTUW0-9]?) [0-9][ABD-HJLNP-UW-Z]{2}/
    assert_match re, result = Faker::Address.postcode, "#{result} didn't match #{re}"
  end

  def test_available_locales
    assert I18n.locale_available?('en-GB')
  end
end
