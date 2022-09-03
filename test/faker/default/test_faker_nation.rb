# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerNation < Test::Unit::TestCase
  def setup
    @tester = Faker::Nation
  end

  def test_flag
    assert_match @tester.flag, /\p{M}*+/
  end

  def test_nationality
    assert_match @tester.nationality, /(\w+\.? ?){2,3}/
  end

  def test_language
    assert_match @tester.language, /[A-Z][a-z]+\.?/
  end

  def test_capital_city
    assert_match @tester.capital_city, /(\w+\.? ?){2,3}/
  end

  def test_national_sport
    assert_match @tester.national_sport, /(\w+\.? ?){2,3}/
  end
end
