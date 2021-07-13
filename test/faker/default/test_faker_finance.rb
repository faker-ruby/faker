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

  def test_ticker
    assert Faker::Finance.ticker.match(/\w+/)
  end

  def test_ticker_with_invalid_params
    assert_raise ArgumentError do
      Faker::Finance.ticker(Faker::Lorem.word)
    end
  end

  def test_ticker_with_valid_params
    ticker_return = Faker::Finance.ticker('nyse')
    assert Faker::Base.fetch_all('finance.ticker.nyse').join(', ').include?(ticker_return)
  end

  def test_stock_market
    assert Faker::Finance.stock_market.match(/\w+/)
  end
end
