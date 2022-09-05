# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerUniqueGenerator < Test::Unit::TestCase
  def test_generates_unique_values
    generator = Faker::UniqueGenerator.new(Faker::Base, 10_000)

    result = [generator.rand_in_range(1, 2), generator.rand_in_range(1, 2)]
    assert_equal([1, 2], result.sort)
  end

  def test_respond_to_missing
    stubbed_generator = Object.new

    generator = Faker::UniqueGenerator.new(stubbed_generator, 3)

    assert_equal(generator.send(:respond_to_missing?, 'faker_address'), true)
    assert_equal(generator.send(:respond_to_missing?, 'address'), false)
  end

  def test_returns_error_when_retries_exceeded
    stubbed_generator = Object.new
    def stubbed_generator.test
      1
    end

    generator = Faker::UniqueGenerator.new(stubbed_generator, 3)

    generator.test

    assert_raises Faker::UniqueGenerator::RetryLimitExceeded do
      generator.test
    end
  end

  def test_includes_field_name_in_error
    stubbed_generator = Object.new
    def stubbed_generator.my_field
      1
    end

    generator = Faker::UniqueGenerator.new(stubbed_generator, 3)

    generator.my_field

    assert_raise_message 'Retry limit exceeded for my_field' do
      generator.my_field
    end
  end

  def test_clears_unique_values
    stubbed_generator = Object.new
    def stubbed_generator.test
      1
    end

    generator = Faker::UniqueGenerator.new(stubbed_generator, 3)

    assert_equal(1, generator.test)

    assert_raises Faker::UniqueGenerator::RetryLimitExceeded do
      generator.test
    end

    generator.clear

    assert_equal(1, generator.test)

    assert_raises Faker::UniqueGenerator::RetryLimitExceeded do
      generator.test
    end

    generator.clear

    assert_equal(1, generator.test)
  end

  def test_clears_unique_values_for_all_generators
    stubbed_generator = Object.new
    def stubbed_generator.test
      1
    end

    stubbed_generator2 = Object.new
    def stubbed_generator2.test
      2
    end

    generator1 = Faker::UniqueGenerator.new(stubbed_generator, 3)
    generator2 = Faker::UniqueGenerator.new(stubbed_generator2, 3)

    assert_equal(1, generator1.test)
    assert_equal(2, generator2.test)

    assert_raises Faker::UniqueGenerator::RetryLimitExceeded do
      generator1.test
    end
    assert_raises Faker::UniqueGenerator::RetryLimitExceeded do
      generator2.test
    end

    Faker::UniqueGenerator.clear

    assert_nothing_raised Faker::UniqueGenerator::RetryLimitExceeded do
      assert_equal(1, generator1.test)
      assert_equal(2, generator2.test)
    end

    assert_raises Faker::UniqueGenerator::RetryLimitExceeded do
      generator1.test
    end
    assert_raises Faker::UniqueGenerator::RetryLimitExceeded do
      generator2.test
    end

    Faker::UniqueGenerator.clear

    assert_nothing_raised Faker::UniqueGenerator::RetryLimitExceeded do
      assert_equal(1, generator1.test)
      assert_equal(2, generator2.test)
    end
  end

  def test_thread_safety
    stubbed_generator = Object.new
    def stubbed_generator.test
      1
    end

    generator = Faker::UniqueGenerator.new(stubbed_generator, 3)

    Thread.new do
      assert_equal(1, generator.test)

      assert_raises Faker::UniqueGenerator::RetryLimitExceeded do
        generator.test
      end
    end.join

    Thread.new do
      assert_equal(1, generator.test)
    end.join

    assert_equal(1, generator.test)

    assert_raises Faker::UniqueGenerator::RetryLimitExceeded do
      generator.test
    end

    Thread.new do
      generator.clear
    end.join

    assert_raises Faker::UniqueGenerator::RetryLimitExceeded do
      generator.test
    end

    generator.clear

    assert_equal(1, generator.test)
  end
end
