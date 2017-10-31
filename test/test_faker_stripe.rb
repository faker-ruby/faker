require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')
class TestFakerStripe < Test::Unit::TestCase

  def setup
    @tester = Faker::Stripe
  end

  def test_valid_card
    assert @tester.valid_card.match(/\d{15,16}$/)
  end

  def test_valid_card()
    assert @tester.valid_card().match(/\d{15,16}$/)
  end

  def test_valid_token
    assert @tester.valid_token.match(/^tok_/)
    assert @tester.valid_token.match(/\w+/)
  end

  def test_valid_token()
    assert @tester.valid_token.match(/^tok_/)
    assert @tester.valid_token.match(/\w+/)
  end

  def test_card_error
    assert @tester.card_error.match(/\d{16}$/)
  end

  def test_card_error_token
    assert @tester.valid_token.match(/^tok_/)
    assert @tester.error_token.match(/\w+/)
  end
end

