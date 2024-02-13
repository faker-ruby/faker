# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHeroesOfTheStorm < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::HeroesOfTheStorm
  end

  def test_battleground
    assert_match(/\w+/, @tester.battleground)
  end

  def test_class_name
    assert_match(/\w+/, @tester.class_name)
  end

  def test_hero
    assert_match(/\w+/, @tester.hero)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end
end
