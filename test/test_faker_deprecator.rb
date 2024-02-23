# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerDeprecation < Test::Unit::TestCase
  def test_using_a_deprecated_generator_returns_a_warning_message
    actual_stdout, actual_stderr = capture_output do
      Faker::IDNumber.valid
    end

    assert_match(actual_stdout, 'DEPRECATION WARNING: the class Faker::IDNumber is deprecated. Use Faker::IdNumber instead.')
    assert_match(actual_stderr, 'DEPRECATION WARNING: the class Faker::IDNumber is deprecated. Use Faker::IdNumber instead.')
  end
end
