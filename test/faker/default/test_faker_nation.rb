# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerNation < Test::Unit::TestCase
  def setup
    @tester = Faker::Nation
  end

  def test_flag
    assert_match(/\p{M}*+/, @tester.flag)
  end

  def test_nationality
    assert_match(/(\w+\.? ?){2,3}/, @tester.nationality)
  end

  def test_language
    assert_match(/[A-Z][a-z]+\.?/, @tester.language)
  end

  def test_capital_city
    assert_match(/(\w+\.? ?){2,3}/, @tester.capital_city)
  end

  def test_national_sport
    assert_match(/(\w+\.? ?){2,3}/, @tester.national_sport)
  end
end
