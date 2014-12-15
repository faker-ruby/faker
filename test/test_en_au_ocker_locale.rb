require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestEnUsLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = nil
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_au_ocker_methods_with_en_au_ocker_locale
    Faker::Config.locale = 'en-au-ocker'

    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.ocker_first_name.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.region.is_a? String
  end

end
