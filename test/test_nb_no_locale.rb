require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestNbNoLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'nb-NO'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_nb_no_methods
    assert Faker::Address.city_root.is_a? String
    assert Faker::Address.city_suffix.is_a? String
    assert Faker::Address.street_prefix.is_a? String
    assert Faker::Address.street_root.is_a? String
    assert Faker::Address.street_suffix.is_a? String
    assert Faker::Address.common_street_suffix.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.name.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.feminine_name.is_a? String
    assert Faker::Name.masculine_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.suffix.is_a? String
    assert Faker::Name.name.is_a? String
  end
end
