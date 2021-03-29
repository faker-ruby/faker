# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerWine < Test::Unit::TestCase

  def setup
    @tester = Faker::Wine
  end

  def test_varietal
    assert @tester.varietal.match(/\w+/)
  end

  def test_vintage
    max_year = ::Time.now.year - 1
    random_amount = @tester.vintage
    assert random_amount >= 1990, "Expected >= 1990, but got #{random_amount}"
    assert random_amount <= max_year, "Expected <= #{max_year}, but got #{random_amount}"
  end

  def test_appellation
    assert @tester.appellation.match(/\w+/)
  end

  def test_corporation
    assert @tester.corporation.match(/\w+/)
  end

  def test_brand
    assert @tester.brand.match(/\w+/)
    assert @tester.brand(real: true).match(/\w+/)
  end

  def test_label
    assert @tester.label.match(/\w+/)
  end

  def test_accolade
    assert @tester.accolade.match(/\w+/)
    assert @tester.accolade(bad: true).match(/\w+/)
  end

  def test_score
    assert @tester.score.match(/\w+/)
    assert @tester.score(with_review_org: true).match(/\w+/)
    assert @tester.score(with_review_person: true).match(/\w+/)
    assert @tester.score(with_review_org: true, with_review_person: true).match(/\w+/)
  end

end
