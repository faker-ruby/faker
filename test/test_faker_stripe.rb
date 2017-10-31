require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')
class TestFakerStripe < Test::Unit::TestCase

  def setup
    @tester = Faker::Stripe
  end

  def test_valid_card
    assert @tester.valid_card.match(/\d{15,16}$/)
  end

  def test_specific_valid_card
    assert @tester.valid_card("visa").match(/\d{15,16}$/)
  end


  def test_invalid_card
    assert @tester.invalid_card.match(/\d{16}$/)
  end

  def test_specific_error_invalid_card
    assert @tester.invalid_card("zipFail").match(/\w+/)
  end
end

