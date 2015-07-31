require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

LoadedIsYaml = ['en', 'is'].inject({}) do |h, locale|
  h[locale] = YAML.load_file(File.expand_path(File.dirname(__FILE__) + "/../lib/locales/#{locale}.yml"))[locale]['faker']
  h
end

class TestIsLocale < Test::Unit::TestCase
  
  def teardown
    Faker::Config.locale = nil
  end

  def test_locale_separate_from_i18n
    I18n.locale = :en
    Faker::Config.locale = :is
    assert Faker::Address.street_name.match(//)
  end
  
  def test_locale_is_phone_number
    Faker::Config.locale = :is
    assert Faker::PhoneNumber.phone_number.match(/^([4-5])([0-9]{2})-()[1-9][0-9]{3}$/)
  end
  
  def test_locale_is_mobile_number
    Faker::Config.locale = :is
    assert Faker::PhoneNumber.cell_phone.match(/^([6-8])([0-9]{2})-()[1-9][0-9]{3}$/)
  end
  
  def test_locale_is_postcode
    Faker::Config.locale = :is
    assert Faker::Address.postcode.match(/^[1-9][0-9]{2}$/)
  end
  
  def test_locale_is_street_name
    Faker::Config.locale = :is
    assert Faker::Address.street_name.match(/^[a-zA-ZáóéúíýþæöðÁÓÉÚÍÝÞÆÖÐ]*$/)
  end
  
  def test_locale_is_street_address
    Faker::Config.locale = :is
    assert Faker::Address.street_address.match(/^[a-zA-ZáóéúíýþæöðÁÓÉÚÍÝÞÆÖÐ]* 1{0,1}[0-9]{1,2}$/)
  end
  
  def test_translation_fallback
    Faker::Config.locale = :is
    
    assert_nil LoadedIsYaml['is']['company']['bs']
    assert_equal Faker::Base.translate('faker.company.bs'), LoadedEsYaml['en']['company']['bs']
    
    assert_nil LoadedIsYaml['is']['commerce']['product_name']
  end

end
