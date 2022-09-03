# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerPhone < Test::Unit::TestCase
  def setup
    @tester = Faker::PhoneNumber
    @phone_with_country_code_regex = /\A\+(\s|\d|-|\(|\)|x|\.)*\z/
  end

  def test_country_code
    assert_match @tester.country_code, /\A\+[\d|-]+\z/
  end

  def test_phone_number_with_country_code
    assert_match @tester.phone_number_with_country_code, @phone_with_country_code_regex
  end

  def test_cell_phone_with_country_code
    assert_match @tester.cell_phone_with_country_code, @phone_with_country_code_regex
  end

  def test_cell_phone_in_e164
    assert_match @tester.cell_phone_in_e164, @phone_with_country_code_regex
  end
end
