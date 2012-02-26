require File.dirname(__FILE__) + '/test_helper.rb'

class TestFakerCreditCard < Test::Unit::TestCase
  def test_visa_format
    assert_match Faker::CreditCard.number(:visa), /^4\d{15}/
  end

  def test_visa_randomness
    generated = []
    100.times do
      new_number = Faker::CreditCard.number(:visa)
      assert !generated.include?(new_number), "Visa numbers should be randomized"
      generated << new_number
    end    
  end

  def test_expiration_structure
    assert_match Faker::CreditCard.expiration_date, /\d{2}\/\d{2}/
  end

  def test_expiration_reasonable_date
    100.times do
      assert_nothing_raised { Date.parse(Faker::CreditCard.expiration_date) }
    end 
  end

  def test_expiration_randomness
    generated = []
    3.times do
      new_date = Faker::CreditCard.expiration_date
      assert !generated.include?(new_date), "Expiration dates should be randomized"
      generated << new_date
    end    
  end

  def test_expiration_futureness
    100.times do
      new_date = Faker::CreditCard.expiration_date
      assert Date.strptime(new_date, "%m/%y") >= Date.today, "Expiration dates should be in the future"
    end    
  end
end
