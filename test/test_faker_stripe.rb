require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerStripe < Test::Unit::TestCase

  def setup
    @tester = Faker::Stripe
    @valid_card_object_list = I18n.translate('faker.stripe.valid_card_objects')
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

  def test_valid_card_object
    # assert @valid_card_object_list.any?{|hash| hash[:ccv] == @tester.valid_card_object[:ccv]}
    assert @valid_card_object_list.include?(@tester.valid_card_object)
  end
end

