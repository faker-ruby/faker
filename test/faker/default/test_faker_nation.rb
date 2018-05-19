# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerNation < Test::Unit::TestCase
  def setup
    @tester = Faker::Nation
  end

  def test_flag
    assert @tester.flag.match(/\p{M}*+/)
  end

  def test_nationality
    assert @tester.nationality.match(/(\w+\.? ?){2,3}/)
  end

  def test_language
    assert @tester.language.match(/[A-Z][a-z]+\.?/)
  end

  def test_capital_city
    assert @tester.capital_city.match(/(\w+\.? ?){2,3}/)
  end

  def test_national_sport
    assert @tester.national_sport.match(/(\w+\.? ?){2,3}/)
  end
end
