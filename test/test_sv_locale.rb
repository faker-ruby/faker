require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestSVLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'sv'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_sv_names
    assert Faker::Name.name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.first_name_men.is_a? String
    assert Faker::Name.first_name_women.is_a? String
    assert Faker::Name.last_name.is_a? String
  end

  def test_sv_phone_number
    assert Faker::PhoneNumber.cell_phone.match(/^07[036]{1}[\-\s]?\d{3}[\-\s]?\d{4}$/)
    assert Faker::PhoneNumber.phone_number.match(/^\d{4}[\s\-]?\d{4,6}$/)
  end

  def test_sv_post_code 
    assert Faker::Address.postcode.match(/^[\d]{5}$/)
  end
end
