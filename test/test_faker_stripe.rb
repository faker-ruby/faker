require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerStripe < Test::Unit::TestCase
  def setup
    @tester = Faker::Stripe
  end

  def test_valid_card
    assert @tester.valid_card.match(/\A\d{14,16}\z/)
  end

  def test_specific_valid_card
    assert @tester.valid_card('visa').match(/\A\d{16}\z/)
  end

  def test_invalid_card
    assert @tester.invalid_card.match(/\A\d{16}\z/)
  end

  def test_specific_error_invalid_card
    assert @tester.invalid_card('zipFail').match(/\w+/)
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
    assert @tester.ccv('amex').match(/\A\d{4}\z/)
  end
end
