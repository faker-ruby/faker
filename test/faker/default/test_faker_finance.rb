# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerFinance < Test::Unit::TestCase
  def setup
    Faker::Config.locale = nil
  end

  def test_vat_number
    assert Faker::Finance.vat_number.match(/\w+/)
  end

  def test_vat_number_with_invalid_params
    assert_raise ArgumentError do
      Faker::Finance.vat_number(country: Faker::Lorem.word)
    end
  end

  def test_vat_number_with_valid_params
    Faker::Finance.vat_number_keys.each do |country|
      assert Faker::Finance.vat_number(country: country).match(/\w+/)
    end
  end

  def test_south_african_vat_number
    assert_match(/\AZA\d{10,11}\z/, Faker::Finance.vat_number(country: 'ZA'))
  end

  # ref: http://pt.wikipedia.org/wiki/N%C3%BAmero_de_identifica%C3%A7%C3%A3o_fiscal
  def test_portuguese_vat_number
    number = Faker::Finance.vat_number(country: 'PT')

    assert number.size == 9
    # check first digit has to be one of the following
    assert [1, 2, 5, 6, 8, 9].include?(number[0].to_i)
    # check valid checksum digit
    assert Faker::Finance.send(:pt_vat_number_checksum_digit, number[0..-2]) == number[-1].to_i
  end
end
