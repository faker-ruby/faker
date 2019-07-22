# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerStripe < Test::Unit::TestCase
  def setup
    @tester = Faker::Stripe
  end

  def test_valid_card
    assert @tester.valid_card.match(/\A\d{14,16}\z/)
  end

  def test_valid_card_error
    assert_raise ArgumentError do
      assert @tester.valid_card(Faker::Lorem.word)
    end
  end

  def test_specific_valid_card
    assert @tester.valid_card(card_type: 'visa').match(/\A\d{16}\z/)
  end

  def test_valid_token
    assert @tester.valid_token.match(/\w+/)
  end

  def test_specific_valid_token
    assert @tester.valid_token(card_type: 'visa').match(/\Atok_visa\z/)
  end

  def test_invalid_card
    assert @tester.invalid_card.match(/\A\d{16}\z/)
  end

  def test_invalid_card_error
    assert_raise ArgumentError do
      assert @tester.invalid_card(Faker::Lorem.word)
    end
  end

  def test_specific_error_invalid_card
    assert @tester.invalid_card(card_error: 'zipFail').match(/\w+/)
  end

  def test_valid_exp_mo
    assert @tester.month.match(/\A\d{2}\z/)
  end

  def test_valid_exp_yr
    assert @tester.year.match(/\A\d{4}\z/)
  end

  def test_valid_ccv
    assert @tester.ccv.match(/\A\d{3}\z/)
  end

  def test_valid_amex_ccv
    assert @tester.ccv(card_type: 'amex').match(/\A\d{4}\z/)
  end
end
