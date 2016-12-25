require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestTRLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'tr'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_it_default_country
    assert_equal('Turkey', Faker::Address.default_country)
  end

  def test_tr_names
    assert Faker::Name.name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.title.is_a? String
    assert Faker::Name.first_name.is_a? String
  end

  def test_tr_internet_fields
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
    assert Faker::Internet.safe_email.is_a? String
  end

  def test_tr_address_fields
    assert Faker::Address.city.is_a? String
    assert Faker::Address.country.is_a? String
  end
end
