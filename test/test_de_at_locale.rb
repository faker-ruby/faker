# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestDeAtLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'de-AT'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_de_at_methods
    assert Faker::Address.country.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.city_name.is_a? String
    assert Faker::Address.street_root.is_a? String
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.name.is_a? String
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.nobility_title_prefix.is_a? String
    assert Faker::Name.name.is_a? String
  end

  def test_at_default_country
    assert_equal('Österreich', Faker::Address.default_country)
  end
end
