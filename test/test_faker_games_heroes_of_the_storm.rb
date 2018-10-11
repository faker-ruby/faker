# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerGamesHeroesOfTheStorm < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::HeroesOfTheStorm
  end

  def test_battleground
    assert @tester.battleground.match(/\w+/)
  end

  def test_class
    assert @tester.class.match(/\w+/)
  end

  def test_hero
    assert @tester.hero.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
