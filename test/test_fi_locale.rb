require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TesetEnLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'fi-FI'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_fi_methods
    assert Faker::Name.first_name_women.is_a? String
    assert Faker::Name.first_name_men.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.city.is_a? String
  end

end
