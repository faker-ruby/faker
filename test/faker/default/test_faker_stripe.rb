# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerStripe < Test::Unit::TestCase
  def setup
    @tester = Faker::Stripe
  end

  def test_valid_card
    assert_match(/\A\d{14,16}\z/, @tester.valid_card)
  end

  def test_valid_card_error
    e = assert_raise ArgumentError do
      assert @tester.valid_card(card_type: Faker::Lorem.word)
    end

    assert_match(/\AValid credit cards argument can be left blank or include/, e.message)
  end

  def test_specific_valid_card
    assert_match(/\A\d{16}\z/, @tester.valid_card(card_type: 'visa'))
  end

  def test_valid_token
    assert_match(/\w+/, @tester.valid_token)
  end

  def test_specific_valid_token
    assert_match(/\Atok_visa\z/, @tester.valid_token(card_type: 'visa'))
  end

  def test_invalid_card
    assert_match(/\A\d{16}\z/, @tester.invalid_card)
  end

  def test_invalid_card_error
    e = assert_raise ArgumentError do
      assert @tester.invalid_card(card_error: Faker::Lorem.word)
    end

    assert_match(/\AInvalid credit cards argument can be left blank or include/, e.message)
  end

  def test_specific_error_invalid_card
    assert_match(/\w+/, @tester.invalid_card(card_error: 'zipFail'))
  end

  def test_valid_exp_mo
    assert_match(/\A\d{2}\z/, @tester.month)
  end

  def test_valid_exp_yr
    assert_match(/\A\d{4}\z/, @tester.year)
  end

  def test_valid_ccv
    assert_match(/\A\d{3}\z/, @tester.ccv)
  end

  def test_valid_amex_ccv
    assert_match(/\A\d{4}\z/, @tester.ccv(card_type: 'amex'))
  end
end
