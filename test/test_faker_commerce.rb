require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerCommerce < Test::Unit::TestCase

  def setup
    @tester = Faker::Commerce
  end
  
  def test_color
    assert @tester.color.match(/[a-z]+\.?/)
  end
  
  def test_department
    assert @tester.department.match(/[A-Z][a-z]+\.?/)
  end
  
  def test_product_name
    assert @tester.product_name.match(/[A-Z][a-z]+\.?/)
  end

  def test_price
    assert_includes 0..100, @tester.price
  end

  def test_price_is_float
    assert @tester.price.is_a? Float
  end
end