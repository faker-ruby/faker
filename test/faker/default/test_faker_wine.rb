# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerWine < Test::Unit::TestCase
  def setup
    @tester = Faker::Wine
  end

  def test_varietal
    assert_match(/\w+/, @tester.varietal)
  end

  def test_vintage
    max_year = ::Time.now.year - 1
    random_amount = @tester.vintage

    assert_operator(random_amount, :>=, 1990, "Expected >= 1990, but got #{random_amount}")
    assert_operator(random_amount, :<=, max_year, "Expected <= #{max_year}, but got #{random_amount}")
  end

  def test_appellation
    assert_match(/\w+/, @tester.appellation)
  end

  def test_corporation
    assert_match(/\w+/, @tester.corporation)
  end

  def test_brand
    assert_match(/\w+/, @tester.brand)
    assert_match(/\w+/, @tester.brand(real: true))
  end

  def test_label
    assert_match(/\w+/, @tester.label)
  end

  def test_accolade
    assert_match(/\w+/, @tester.accolade)
    assert_match(/\w+/, @tester.accolade(bad: false))
  end

  def test_score
    assert_match(/\w+/, @tester.score)
    assert_match(/\w+/, @tester.score(with_review_org: true))
    assert_match(/\w+/, @tester.score(with_review_person: true))
    assert_match(/\w+/, @tester.score(with_review_org: true, with_review_person: true))
  end
end
