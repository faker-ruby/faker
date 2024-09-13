# frozen_string_literal: true

require_relative '../test_helper'

class TestFakerDeprecation < Test::Unit::TestCase
  def test_using_a_deprecated_generator_returns_a_warning_message
    assert_deprecated do
      Faker::Dogs.say
    end

    assert_equal 'meow', Faker::Dogs.say
  end

  def test_using_a_non_deprecated_generator_does_not_return_a_warning_message
    assert_not_deprecated do
      Faker::Cats.say
    end
    assert_equal 'meow', Faker::Cats.say
  end

  def test_testing_a_deprecated_generator_with_skip_warning_does_not_return_a_warning_message
    actual_stdout, actual_stderr = capture_output do
      Faker::Deprecator.skip_warning do
        Faker::Dogs.say
      end
    end

    assert_empty(actual_stdout)
    assert_empty(actual_stderr)
    assert_equal 'meow', Faker::Dogs.say
  end

  def test_deprecated_with_skip_warning_does_not_generate_message
    Faker::Deprecator.skip_warning do
      assert_not_deprecated do
        Faker::Dogs.say
      end
    end

    assert_equal 'meow', Faker::Dogs.say
  end
end

module Faker
  class Cats < Base
    def self.say
      'meow'
    end
  end

  include Faker::Deprecator
  deprecate_generator('Dogs', Cats)
end
