
require_relative 'test_helper'

class TestFakerPhone < Test::Unit::TestCase
  def setup
    @tester = Faker::PhoneNumber
  end

  def test_country_code
    assert @tester.country_code.match(/\A\+[\d|-]+\z/)
  end

  def test_phone_number_with_country_code
    assert @tester.phone_number_with_country_code.match(/\A\+[\s|\d|\-|\(|\)|x|\.]*\z/)
  end

  def test_cell_phone_with_country_code
    assert @tester.cell_phone_with_country_code.match(/\A\+[\s|\d|\-|\(|\)|x|\.]*\z/)
  end
end
