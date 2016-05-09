require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestDeAtLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'de-AT'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_de_ch_methods
    assert Faker::Address.country_code.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.name.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
  end
end
