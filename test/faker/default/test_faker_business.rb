# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBusiness < Test::Unit::TestCase
  def setup
    @tester = Faker::Business
    @credit_card_number_list = I18n.translate('faker.business.credit_card_numbers')
    @credit_card_types = I18n.translate('faker.business.credit_card_types')
    @minimum_expiry_date = ::Date.today + 365
    @maximum_expiry_date = ::Date.today + (365 * 4)
  end

  def test_credit_card_number
    number1 = @tester.credit_card_number
    number2 = @tester.credit_card_number
    assert_includes @credit_card_number_list, number1
    assert_includes @credit_card_number_list, number2
  end

  def test_credit_card_expiry_date
    date1 = @tester.credit_card_expiry_date
    date2 = @tester.credit_card_expiry_date
    assert date1.between?(@minimum_expiry_date, @maximum_expiry_date)
    assert date2.between?(@minimum_expiry_date, @maximum_expiry_date)
  end

  def test_credit_card_type
    type1 = @tester.credit_card_type
    type2 = @tester.credit_card_type
    assert_includes @credit_card_types, type1
    assert_includes @credit_card_types, type2
  end
end
