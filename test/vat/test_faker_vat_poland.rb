require File.dirname(__FILE__) + '/../test_helper.rb'

class TestFakerVatPoland < Test::Unit::TestCase

  def test_size
    assert Faker::Vat::Poland.number.size == 10
  end

  def test_checksum
    weights = [6, 5, 7, 2, 3, 4, 5, 6, 7]

    1000.times do
      numbers = Faker::Vat::Poland.number.split(//).collect(&:to_i)
      checksum = weights.inject(0) { |sum, weight| sum + weight * numbers.shift }
      assert (checksum % 11 === numbers.shift), "Poland VAT IN number should be correct"
    end
  end

end
