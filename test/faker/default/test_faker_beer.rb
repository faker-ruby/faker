# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBeer < Test::Unit::TestCase
  def setup
    @tester = Faker::Beer
  end

  def test_brand
    assert_match @tester.brand, /(\w+\.? ?){2,3}/
  end

  def test_name
    assert_match @tester.name, /(\w+\.? ?){2,3}/
  end

  def test_style
    assert_match @tester.style, /(\w+\.? ?){2,3}/ # TODO
  end

  def test_hop
    assert_match @tester.hop, /(\w+\.? ?){2,3}/
  end

  def test_yeast
    assert_match @tester.yeast, /(\w+\.? ?){2,3}/
  end

  def test_malts
    assert_match @tester.malts, /(\w+\.? ?){2,3}/
  end

  def test_ibu
    assert_match @tester.ibu, /(\w+\.? ?){2,3}/
  end

  def test_alcohol
    assert_match @tester.alcohol, /(\w+\.? ?){2,3}/
  end

  def test_blg
    assert_match @tester.blg, /(\w+\.? ?){2,3}/
  end
end
