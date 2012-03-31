require File.dirname(__FILE__) + '/test_helper.rb'

class TestFakerVat < Test::Unit::TestCase

  def test_number_for_country
    Faker::Vat::Poland.expects :number
    Faker::Vat.number :poland
  end

  def test_raises_no_constant
    assert_raise(Faker::Vat::NoExistCountryError) do 
      Faker::Vat.number :no_exist_country
    end
  end

end
