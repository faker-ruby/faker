# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCreatureBird < Test::Unit::TestCase
  def setup
    @tester = Faker::Creature::Bird
  end

  def test_order
    assert @tester.order.match(/[A-Z]\w+formes/)
  end

  def test_anatomy
    assert @tester.anatomy.match(/[a-z]+/)
  end

  def test_anatomy_past_tense
    assert @tester.anatomy_past_tense.match(/[a-z]+ed$/)
  end

  def test_geo
    assert @tester.geo.match(/[A-Za-z][a-z ]/)
  end

  def test_color
    assert @tester.color.match(/[a-z]+/)
  end

  def test_silly_adjectives
    assert @tester.emotional_adjective.match(/[a-z]+/) && @tester.silly_adjective.match(/[a-z]+/)
  end

  def test_adjective
    assert @tester.adjective.match(/[a-z]+/)
  end

  def test_common_name
    assert @tester.common_name.match(/[A-Z][a-z]+/)
  end
end
