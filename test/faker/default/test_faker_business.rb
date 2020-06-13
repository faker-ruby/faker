# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBusiness < Test::Unit::TestCase
  def setup
    @tester = Faker::Business
    @credit_card_number_list = I18n.translate('faker.business.credit_card_numbers')
    @card_types = I18n.translate('faker.business.valid_cards').keys
    @card_brands = I18n.translate('faker.business.card_brands')
    @minimum_expiry_date = ::Date.today
    @maximum_expiry_date = ::Date.today + (365 * 4)
  end

  def test_card_expiry_date
    date1 = @tester.card_expiry_date
    date2 = @tester.card_expiry_date
    assert date1.between?(@minimum_expiry_date, @maximum_expiry_date)
    assert date2.between?(@minimum_expiry_date, @maximum_expiry_date)
  end

  def test_card_type
    type1 = @tester.card_type
    type2 = @tester.card_type
    assert @card_types.include?(type1.to_sym)
    assert @card_types.include?(type2.to_sym)
  end

  def test_card_brand
    brand1 = @tester.card_brand
    brand2 = @tester.card_brand
    assert @card_brands.include?(brand1)
    assert @card_brands.include?(brand2)
  end

  def test_valid_card_expiry_month
    assert @tester.card_expiry_month.match(/\A\d{2}\z/)
  end

  def test_valid_card_expiry_year
    assert @tester.card_expiry_year.match(/\A\d{4}\z/)
    assert @tester.card_expiry_year.to_i.between?(
      @minimum_expiry_date.year + 1,
      @maximum_expiry_date.year
    )
  end

  def test_valid_card_number
    assert @tester.valid_card_number.match(/\A\d{14,16}\z/)
  end

  def test_valid_card_error
    e = assert_raise ArgumentError do
      assert @tester.valid_card_number(card_type: Faker::Lorem.word)
    end

    assert_match(/\AValid credit cards argument can be left blank or include/, e.message)
  end

  def test_specific_valid_card_number
    assert @tester.valid_card_number(card_type: 'visa').match(/\A\d{16}\z/)
  end

  def test_invalid_card_number
    assert @tester.invalid_card_number.match(/\A\d{16}\z/)
  end

  def test_invalid_card_error
    e = assert_raise ArgumentError do
      assert @tester.invalid_card_number(card_error: Faker::Lorem.word)
    end

    assert_match(/\AInvalid credit cards argument can be left blank or include/, e.message)
  end

  def test_specific_error_invalid_card
    assert @tester.invalid_card_number(card_error: 'zipFail').match(/\w+/)
  end

  def test_valid_ccv
    assert @tester.ccv.match(/\A\d{3}\z/)
  end

  def test_valid_amex_ccv
    assert @tester.ccv(card_type: 'amex').match(/\A\d{4}\z/)
  end

  # deprecated
  def test_credit_card_expiry_date
    date1 = @tester.credit_card_expiry_date
    date2 = @tester.credit_card_expiry_date
    assert date1.between?(@minimum_expiry_date, @maximum_expiry_date)
    assert date2.between?(@minimum_expiry_date, @maximum_expiry_date)
  end

  # deprecated
  def test_credit_card_type
    type1 = @tester.credit_card_type
    type2 = @tester.credit_card_type
    assert @card_types.include?(type1.to_sym)
    assert @card_types.include?(type2.to_sym)
  end

  # deprecated
  def test_credit_card_number
    @tester.credit_card_number.match(/\A(\d{4}\-){3}\d{4}\z/)
  end
end
