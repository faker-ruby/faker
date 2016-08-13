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

  def test_single_department_should_not_contain_separators
    assert_match(/\A[A-Za-z]+\z/, @tester.department(1))
  end

  def test_department_should_have_ampersand_as_default_separator
    assert_match ' & ', @tester.department(2, true)
  end

  def test_department_should_accept_localized_separator
    @old_locales = I18n.config.available_locales
    data = {
      :faker => {
        :separator => ' + ',
        :commerce => {
          :department => ['Books', 'Movies']
        }
      }
    }

    I18n.backend.store_translations(:xy, data)
    I18n.config.available_locales += [ :xy ]
    I18n.with_locale(:xy) do
      assert_match ' + ', @tester.department(2, true)
    end
    I18n.config.available_locales = @old_locales
  end

  def test_department_should_have_exact_number_of_categories_when_fixed_amount
    assert_match(/\A([A-Za-z]+, ){8}[A-Za-z]+ & [A-Za-z]+\z/, @tester.department(10, true))
  end

  def test_department_should_never_exceed_the_max_number_of_categories_when_random_amount
    100.times do
      assert_match(/\A([A-Za-z]+(, | & )){0,5}[A-Za-z]+\z/, @tester.department(6))
    end
  end

  def test_department_should_have_no_duplicate_categories
    department = @tester.department(10, true)

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
    assert_instance_of Float, @tester.price(5..6)
    assert_includes 5..6, @tester.price(5..6)
    assert_includes 990...1000, @tester.price(990...1000)
  end

  def test_price_with_srand
    srand(12345)
    assert_equal 92.96, @tester.price
  end

  def test_price_is_float
    assert @tester.price.is_a? Float
  end
end
