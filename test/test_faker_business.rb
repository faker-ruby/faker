require File.dirname(__FILE__) + '/test_helper.rb'

class TestFakerBusiness < Test::Unit::TestCase

  def setup
    @tester = Faker::Business
    @credit_card_number_list = I18n.translate('faker.business.credit_card_numbers')
    @credit_card_number_expiry_dates = I18n.translate('faker.business.credit_card_expiry_dates')
  end

  def test_credit_card_number
    number1 = @tester.credit_card_number
    number2 = @tester.credit_card_number
    assert @credit_card_number_list.include?(number1) 
    assert @credit_card_number_list.include?(number2) 
  end
  
  def test_credit_card_expiry_date
    date1 = @tester.credit_card_expiry_date
    date2 = @tester.credit_card_expiry_date
    assert @credit_card_number_expiry_dates.collect{|d| Date.parse(d)}.include?(date1) 
    assert @credit_card_number_expiry_dates.collect{|d| Date.parse(d)}.include?(date2)
  end
  
end
