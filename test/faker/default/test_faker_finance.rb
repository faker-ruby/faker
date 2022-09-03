# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerFinance < Test::Unit::TestCase
  def setup
    Faker::Config.locale = nil
  end

  def test_vat_number
    assert_match Faker::Finance.vat_number, /\w+/
  end

  def test_vat_number_with_invalid_params
    assert_raise ArgumentError do
      Faker::Finance.vat_number(country: Faker::Lorem.word)
    end
  end

  def test_vat_number_with_valid_params
    Faker::Finance.vat_number_keys.each do |country|
      assert_match Faker::Finance.vat_number(country: country), /\w+/
    end
  end

  def test_south_african_vat_number
    assert_match(/\AZA\d{10,11}\z/, Faker::Finance.vat_number(country: 'ZA'))
  end

  def test_ticker
    assert_match Faker::Finance.ticker, /\w+/
  end

  def test_ticker_with_invalid_params
    assert_raise ArgumentError do
      Faker::Finance.ticker(Faker::Lorem.word)
    end
  end

  def test_ticker_with_valid_params
    ticker_return = Faker::Finance.ticker('nyse')
    assert_includes Faker::Base.fetch_all('finance.ticker.nyse').join(', '), ticker_return
  end

  def test_stock_market
    assert_match Faker::Finance.stock_market, /\w+/
  end
end
