# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerName < Test::Unit::TestCase
  def setup
    @tester = Faker::Name
  end

  def test_name
    assert_match @tester.name, /(\w+\.? ?){2,3}/
  end

  def test_name_with_middle
    assert_match @tester.name_with_middle, /(\w+\.? ?){3,4}/
  end

  def test_first_name
    assert_match @tester.first_name, /(\w+\.? ?){3,4}/
  end

  def test_male_first_name
    assert @tester.male_first_name.is_a? String
  end

  def test_female_first_name
    assert @tester.female_first_name.is_a? String
  end

  def test_neutral_first_name
    assert @tester.neutral_first_name.is_a? String
  end

  def test_middle_name
    assert_match @tester.middle_name, /(\w+\.? ?){3,4}/
  end

  def test_last_name
    assert_match @tester.last_name, /(\w+\.? ?){3,4}/
  end

  def test_prefix
    assert_match @tester.prefix, /[A-Z][a-z]+\.?/
  end

  def test_suffix
    assert_match @tester.suffix, /[A-Z][a-z]*\.?/
  end

  def test_initials
    assert_match @tester.initials, /[A-Z]{3}/
    assert_match @tester.initials(number: 2), /[A-Z]{2}/
  end
end
