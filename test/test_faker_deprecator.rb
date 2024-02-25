# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerDeprecation < Test::Unit::TestCase
  def test_using_a_deprecated_generator_returns_a_warning_message
    actual_stdout, actual_stderr = capture_output do
      Faker::IDNumber.valid
    end

    assert_includes(actual_stdout, 'DEPRECATION WARNING: Faker::IDNumber is deprecated. Use Faker::IdNumber instead')
    assert_empty(actual_stderr)
  end

  def test_using_a_non_deprecated_generator_does_not_return_a_warning_message
    actual_stdout, actual_stderr = capture_output do
      Faker::IdNumber.valid
    end

    assert_empty(actual_stdout)
    assert_empty(actual_stderr)
  end
end
