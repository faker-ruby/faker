require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

LoadedEsYaml = ['en', 'es'].inject({}) do |h, locale|
  h[locale] = YAML.load_file(File.expand_path(File.dirname(__FILE__) + "/../lib/locales/#{locale}.yml"))[locale]['faker']
  h
end

class TestEsLocale < Test::Unit::TestCase
  def teardown
    Faker::Config.locale = nil
  end

  def test_locale_separate_from_i18n
    I18n.locale = :en
    Faker::Config.locale = :es
    assert Faker::Address.street_name.match(//)
  end

  def test_configured_locale_translation
    Faker::Config.locale = 'es'
    assert_equal Faker::Base.translate('faker.address.city_prefix').first, LoadedEsYaml['es']['address']['city_prefix'].first
  end

  def test_locale_override_when_calling_translate
    Faker::Config.locale = 'es'
    assert_equal Faker::Base.translate('faker.lorem.words', :locale => :en).first, LoadedEsYaml['en']['lorem']['words'].first
  end

  def test_translation_fallback
    Faker::Config.locale = 'es'
    assert_nil LoadedEsYaml['es']['company']['bs']
    assert_equal Faker::Base.translate('faker.company.bs'), LoadedEsYaml['en']['company']['bs']
  end
end
