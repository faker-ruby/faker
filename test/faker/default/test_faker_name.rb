# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerName < Test::Unit::TestCase
  def setup
    @tester = Faker::Name
  end

  def test_name
    assert_match(/(\w+\.? ?){2,3}/, @tester.name)
  end

  def test_name_with_middle
    assert_match(/(\w+\.? ?){3,4}/, @tester.name_with_middle)
  end

  def test_first_name
    assert_match(/(\w+\.? ?){2,4}/, @tester.first_name)
  end

  def test_male_first_name
    assert_kind_of String, @tester.male_first_name
  end

  def test_female_first_name
    assert_kind_of String, @tester.female_first_name
  end

  def test_neutral_first_name
    assert_kind_of String, @tester.neutral_first_name
  end

  def test_middle_name
    assert_match(/(\w+\.? ?){3,4}/, @tester.middle_name)
  end

  def test_last_name
    assert_match(/(\w+\.? ?){3,4}/, @tester.last_name)
  end

  def test_prefix
    assert_match(/[A-Z][a-z]+\.?/, @tester.prefix)
  end

  def test_suffix
    assert_match(/[A-Z][a-z]*\.?/, @tester.suffix)
  end

  def test_initials
    assert_match(/[A-Z]{3}/, @tester.initials)
    assert_match(/[A-Z]{2}/, @tester.initials(number: 2))
  end

  def test_first_name_with_except
    excluded_name = 'John'
    20.times do
      name = @tester.except(excluded_name).first_name
      assert_not_equal excluded_name, name, "Should not generate excluded name '#{excluded_name}'"
    end
  end

  def test_last_name_with_except_array
    excluded_names = %w[Smith Jones]
    20.times do
      last_name = @tester.except(excluded_names).last_name
      assert_not_includes excluded_names, last_name, "Should not generate names in #{excluded_names.inspect}"
    end
  end
end
