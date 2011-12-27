require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

LoadedYaml = ['en', 'en-bork'].inject({}) do |h, locale|
  h[locale] = YAML.load_file(File.expand_path(File.dirname(__FILE__) + "/../lib/locales/#{locale}.yml"))[locale]['faker']
  h
end

class TestLocale < Test::Unit::TestCase
  def teardown
    Faker::Config.locale = nil
  end

  def test_locale_separate_from_i18n
    I18n.locale = :en
    Faker::Config.locale = :de
    assert Faker::PhoneNumber.phone_number.match(/\(0\d+\) \d+|\+49-\d+-\d+/)
    assert Faker::Address.street_name.match(//)
  end

  def test_configured_locale_translation
    Faker::Config.locale = 'en-bork'
    assert_equal Faker::Base.translate('faker.lorem.words').first, LoadedYaml['en-bork']['lorem']['words'].first
  end

  def test_locale_override_when_calling_translate
    Faker::Config.locale = 'en-bork'
    assert_equal Faker::Base.translate('faker.lorem.words', :locale => :en).first, LoadedYaml['en']['lorem']['words'].first
  end

  def test_translation_fallback
    Faker::Config.locale = 'en-bork'
    assert_nil LoadedYaml['en-bork']['name']
    assert_equal Faker::Base.translate('faker.name.first_name').first, LoadedYaml['en']['name']['first_name'].first
  end

  def test_regex
    Faker::Config.locale = 'en-gb'
    re = /[A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}/
    assert re.match(result = Faker::Address.postcode), "#{result} didn't match #{re}"
  end
end
