# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDeprecatedClass < Test::Unit::TestCase
  def setup
    @tester = Faker::DeprecatedClass
  end

  def test_non_nested_class_with_deprecated_class
    actual_stdout, actual_stderr = capture_output do
      Faker::IDNumber.valid
    end

    assert_empty actual_stdout
    assert_match('DEPRECATION WARNING: the class Faker::IDNumber is deprecated. Use Faker::IdNumber instead.', actual_stderr)
  end

  def test_nested_class_with_deprecated_class
    actual_stdout, actual_stderr = capture_output do
      Faker::Movies::HarryPotterDeprecated.character
    end

    assert_empty actual_stdout
    assert_match('DEPRECATION WARNING: the class Faker::Movies::HarryPotterDeprecated is deprecated. Use Faker::Movies::HarryPotter instead.', actual_stderr)
  end
end
