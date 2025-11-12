# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerExceptGenerator < Test::Unit::TestCase
  def setup
    @tester = Faker::Name
  end

  def test_except_with_single_value
    excluded_name = 'John'
    100.times do
      name = @tester.except(excluded_name).first_name

      assert_not_equal excluded_name, name, "Generated name should not be '#{excluded_name}'"
    end
  end

  def test_except_with_array_of_values
    excluded_names = %w[John Jane Bob]
    100.times do
      name = @tester.except(excluded_names).first_name

      assert_not_includes excluded_names, name, "Generated name should not be in #{excluded_names.inspect}"
    end
  end

  def test_except_with_multiple_methods
    excluded_name = 'Smith'
    100.times do
      last_name = @tester.except(excluded_name).last_name

      assert_not_equal excluded_name, last_name, "Generated last name should not be '#{excluded_name}'"
    end
  end

  def test_except_raises_error_when_retry_limit_exceeded
    # Create a generator that only returns one value
    generator = Class.new(Faker::Base) do
      def self.single_value
        'OnlyValue'
      end
    end

    error = assert_raises(Faker::ExceptGenerator::RetryLimitExceeded) do
      generator.except('OnlyValue', 10).single_value
    end

    assert_match(/Retry limit exceeded/, error.message)
    assert_match(/single_value/, error.message)
    assert_match(/OnlyValue/, error.message)
  end

  def test_except_with_low_retry_limit
    # This should work even with a low retry limit if the excluded value is uncommon
    name = @tester.except('VeryUncommonName', 10).first_name

    assert_not_equal 'VeryUncommonName', name
  end

  def test_except_returns_different_values
    excluded_names = %w[John Jane]
    names = 50.times.map { @tester.except(excluded_names).first_name }

    # Should generate multiple different names (not all the same)
    assert_operator names.uniq.length, :>, 1, 'Should generate varied names'

    # None should be excluded
    names.each do |name|
      assert_not_includes excluded_names, name
    end
  end

  def test_except_with_method_arguments
    # Test that except works with methods that take arguments
    excluded_number = 5
    100.times do
      number = Faker::Number.except(excluded_number).between(from: 1, to: 10)

      assert_not_equal excluded_number, number, "Generated number should not be #{excluded_number}"
    end
  end

  def test_except_deterministic_with_seed
    Faker::Config.random = Random.new(42)
    result1 = @tester.except('John').first_name

    Faker::Config.random = Random.new(42)
    result2 = @tester.except('John').first_name

    assert_equal result1, result2, 'Results should be deterministic with same seed'

    Faker::Config.random = nil
  end

  def test_respond_to_missing
    except_generator = @tester.except('John')

    assert_respond_to except_generator, :first_name
    assert_respond_to except_generator, :last_name
    assert_false except_generator.respond_to?(:nonexistent_method)
  end
end
