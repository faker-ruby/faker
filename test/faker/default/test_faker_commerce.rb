# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCommerce < Test::Unit::TestCase
  def setup
    @tester = Faker::Commerce
  end

  def test_color
    assert @tester.color.match(/[a-z]+\.?/)
  end

  def test_promotion_code
    assert @tester.promotion_code.match(/[A-Z][a-z]+[A-Z][a-z]+\d{6}/)
  end

  def test_promotion_code_should_have_specified_number_of_digits
    assert @tester.promotion_code(digits: 3).match(/[A-Z][a-z]+[A-Z][a-z]+\d{3}/)
  end

  def test_department
    assert @tester.department.match(/[A-Z][a-z]+\.?/)
  end

  def test_single_department_should_not_contain_separators
    assert_match(/\A[A-Za-z]+\z/, @tester.department(max: 1))
  end

  def test_department_should_have_ampersand_as_default_separator
    assert_match ' & ', @tester.department(max: 2, fixed_amount: true)
  end

  def test_department_should_accept_localized_separator
    @old_locales = I18n.config.available_locales
    data = {
      faker: {
        separator: ' + ',
        commerce: {
          department: %w[Books Movies]
        }
      }
    }

    I18n.config.available_locales += [:xy]
    I18n.backend.store_translations(:xy, data)
    I18n.with_locale(:xy) do
      assert_match ' + ', @tester.department(max: 2, fixed_amount: true)
    end
    I18n.config.available_locales = @old_locales
  end

  def test_department_should_have_exact_number_of_categories_when_fixed_amount
    assert_match(/\A([A-Za-z]+, ){8}[A-Za-z]+ & [A-Za-z]+\z/, @tester.department(max: 10, fixed_amount: true))
  end

  def test_department_should_never_exceed_the_max_number_of_categories_when_random_amount
    100.times do
      assert_match(/\A([A-Za-z]+(, | & )){0,5}[A-Za-z]+\z/, @tester.department(max: 6))
    end
  end

  def test_department_should_have_no_duplicate_categories
    department = @tester.department(max: 10, fixed_amount: true)

    departments = department.split(/[,& ]+/)
    assert_equal departments, departments.uniq
  end

  def test_product_name
    assert @tester.product_name.match(/[A-Z][a-z]+\.?/)
  end

  def test_material
    assert @tester.material.match(/[A-Z][a-z]+\.?/)
  end

  def test_price
    assert_includes 0..100, @tester.price
    assert_instance_of Float, @tester.price(range: 5..6)
    assert_includes 5..6, @tester.price(range: 5..6)
    assert_includes 990...1000, @tester.price(range: 990...1000)
  end

  def test_price_with_srand
    Faker::Config.random = Random.new(12_345)
    assert_equal 92.96, @tester.price
  end

  def test_price_is_float
    assert @tester.price.is_a? Float
  end

  def test_when_as_string_is_true
    assert @tester.price(range: 0..100.0, as_string: true).is_a?(String)
    assert @tester.price(range: 100..500.0, as_string: true).include?('.')
  end

  def test_brand
    assert @tester.brand.match(/[A-Z][a-z]+\.?/)
  end

  def test_vendor
    assert @tester.vendor.match(/[A-Z][a-z]+\.?/)
  end
end
