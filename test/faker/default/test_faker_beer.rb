# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBeer < Test::Unit::TestCase
  def setup
    @tester = Faker::Beer
  end

  def test_brand
    assert_match(/(\w+\.? ?){2,3}/, @tester.brand)
  end

  def test_name
    assert_match(/(\w+\.? ?){2,3}/, @tester.name)
  end

  def test_style
    assert_match(/(\w+\.? ?){2,3}/, @tester.style) # TODO
  end

  def test_hop
    assert_match(/(\w+\.? ?){2,3}/, @tester.hop)
  end

  def test_yeast
    assert_match(/(\w+\.? ?){2,3}/, @tester.yeast)
  end

  def test_malts
    assert_match(/(\w+\.? ?){2,3}/, @tester.malts)
  end

  def test_ibu
    assert_match(/(\w+\.? ?){2,3}/, @tester.ibu)
  end

  def test_alcohol
    assert_match(/(\w+\.? ?){2,3}/, @tester.alcohol)
  end

  def test_blg
    assert_match(/(\w+\.? ?){2,3}/, @tester.blg)
  end
end
