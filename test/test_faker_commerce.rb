require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerCommerce < Test::Unit::TestCase

  def setup
    @tester = Faker::Commerce
    @colors = I18n.translate('faker.commerce.color')
    @sizes = I18n.translate('faker.commerce.size')
  end

  def test_product_names
    10.times { assert_includes @colors, @tester.color }
  end

  def test_sizes
    10.times { assert_includes @sizes, @tester.size }
  end

end
