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
end
