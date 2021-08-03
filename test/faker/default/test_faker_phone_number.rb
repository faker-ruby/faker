# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerPhone < Test::Unit::TestCase
  def setup
    @tester = Faker::PhoneNumber
    @phone_with_country_code_regex = /\A\+(\s|\d|-|\(|\)|x|\.)*\z/
  end

  def test_country_code
    assert @tester.country_code.match(/\A\+[\d|-]+\z/)
  end

  def test_phone_number_with_country_code
    assert @tester.phone_number_with_country_code.match(@phone_with_country_code_regex)
  end

  def test_cell_phone_with_country_code
    assert @tester.cell_phone_with_country_code.match(@phone_with_country_code_regex)
  end

  def test_cell_phone_in_e164
    assert @tester.cell_phone_in_e164.match(@phone_with_country_code_regex)
  end
end
