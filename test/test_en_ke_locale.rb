require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestEnKeLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'en-KE'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_en_ke_methods
    assert Faker::Name.name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.male_first_name.is_a? String
    assert Faker::Name.female_first_name.is_a?(String)
  end
end
