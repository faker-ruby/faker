# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerName < Test::Unit::TestCase
  def setup
    @tester = Faker::Name
  end

  def test_name
    assert @tester.name.match(/(\w+\.? ?){2,3}/)
  end

  def test_name_with_middle
    assert @tester.name_with_middle.match(/(\w+\.? ?){3,4}/)
  end

  def test_first_name
    assert @tester.first_name.match(/(\w+\.? ?){3,4}/)
  end

  def test_male_first_name
    assert @tester.male_first_name.is_a? String
  end

  def test_female_first_name
    assert @tester.female_first_name.is_a? String
  end

  def test_middle_name
    assert @tester.middle_name.match(/(\w+\.? ?){3,4}/)
  end

  def test_last_name
    assert @tester.last_name.match(/(\w+\.? ?){3,4}/)
  end

  def test_prefix
    assert @tester.prefix.match(/[A-Z][a-z]+\.?/)
  end

  def test_suffix
    assert @tester.suffix.match(/[A-Z][a-z]*\.?/)
  end

  def test_initials
    assert @tester.initials.match(/[A-Z]{3}/)
    assert @tester.initials(number: 2).match(/[A-Z]{2}/)
  end

  def test_international_name
    assert @tester.international_name.is_a? String
    assert @tester.international_name(from_locales: ['en-US', 'en-CA']).match(/(\w+\.? ?){2,3}/)
  end
end
