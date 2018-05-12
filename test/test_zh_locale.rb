require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestZhLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'zh-CN'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_ch_methods
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.city_prefix.is_a? String
    assert Faker::Address.city_suffix.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::University.prefix.is_a? String
    assert Faker::University.suffix.is_a? String
    assert Faker::University.name.is_a? String
  end
end