# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerStripe < Test::Unit::TestCase
  def setup
    @tester = Faker::Stripe
  end

  def test_valid_card
    assert_match @tester.valid_card, /\A\d{14,16}\z/
  end

  def test_valid_card_error
    e = assert_raise ArgumentError do
      assert @tester.valid_card(card_type: Faker::Lorem.word)
    end

    assert_match(/\AValid credit cards argument can be left blank or include/, e.message)
  end

  def test_specific_valid_card
    assert_match @tester.valid_card(card_type: 'visa'), /\A\d{16}\z/
  end

  def test_valid_token
    assert_match @tester.valid_token, /\w+/
  end

  def test_specific_valid_token
    assert_match @tester.valid_token(card_type: 'visa'), /\Atok_visa\z/
  end

  def test_invalid_card
    assert_match @tester.invalid_card, /\A\d{16}\z/
  end

  def test_invalid_card_error
    e = assert_raise ArgumentError do
      assert @tester.invalid_card(card_error: Faker::Lorem.word)
    end

    assert_match(/\AInvalid credit cards argument can be left blank or include/, e.message)
  end

  def test_specific_error_invalid_card
    assert_match @tester.invalid_card(card_error: 'zipFail'), /\w+/
  end

  def test_valid_exp_mo
    assert_match @tester.month, /\A\d{2}\z/
  end

  def test_valid_exp_yr
    assert_match @tester.year, /\A\d{4}\z/
  end

  def test_valid_ccv
    assert_match @tester.ccv, /\A\d{3}\z/
  end

  def test_valid_amex_ccv
    assert_match @tester.ccv(card_type: 'amex'), /\A\d{4}\z/
  end
end
