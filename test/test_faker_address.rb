require File.dirname(__FILE__) + '/test_helper.rb'

class TestFakerAddress < Test::Unit::TestCase

  def setup
    @tester = Faker::Address
    @list_of_country_codes = I18n.translate('faker.address.country_code')
  end

  def test_country_code
    country_code = @tester.country_code
    assert @list_of_country_codes.include?(country_code)
  end
end
