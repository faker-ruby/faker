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
    assert @tester.male_first_name.is_a? String
  end

  def test_female_first_name
    assert @tester.female_first_name.is_a? String
  end

  def test_neutral_first_name
    assert @tester.neutral_first_name.is_a? String
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
end
