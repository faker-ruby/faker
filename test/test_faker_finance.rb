# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerFinance < Test::Unit::TestCase
  def setup
    Faker::Config.locale = nil
  end

  def test_vat_number
    Faker::Finance::VAT_NUMBER_TYPES.each do |country|
      assert Faker::Finance.vat_number(country).match(/\w+/)
    end
  end
end
