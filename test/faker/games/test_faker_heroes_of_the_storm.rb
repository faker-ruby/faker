# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHeroesOfTheStorm < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::HeroesOfTheStorm
  end

  def test_battleground
    assert_match @tester.battleground, /\w+/
  end

  def test_class_name
    assert_match @tester.class_name, /\w+/
  end

  def test_hero
    assert_match @tester.hero, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end
end
