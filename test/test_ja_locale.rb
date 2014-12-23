require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestJaLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = nil
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_ja_locale
    Faker::Config.locale = 'ja'

    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.city.is_a? String
  end

  def test_ja_post_codes
    Faker::Config.locale = 'ja'
    expected = /\d{3}(\-\d{4})?/
    assert_match(expected, Faker::Address.post_code)
  end

end
