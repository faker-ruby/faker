require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestUkLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'uk'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_uk_email_at_symbol_is_not_followed_by_dot
    assert Faker::Internet.email.match(/.+@[^.].+\.[A-Za-z\u{410}-\u{44f}]+/)
  end

  def test_uk_domain_word_returns_latin_chars
    assert Faker::Internet.domain_word.match(/^\w+$/)
  end

  def test_uk_zipcode_length
    assert Faker::Address.zip_code.match(/^\d{5}$/)
  end

  def test_uk_street_prefix_returns_true_value
    assert_send([Faker::Address, :street_prefix])
  end

  def test_uk_city_prefix_absent
    assert_equal("", Faker::Address.city_prefix)
  end

  def test_uk_city_suffix_absent
    assert_equal("", Faker::Address.city_suffix)
  end

  def test_uk_states_do_not_have_abbreviations
    assert_equal("", Faker::Address.state_abbr)
  end

  def test_uk_company_prefix_returns_true_value
    assert_send([Faker::Company, :prefix])
  end
end
