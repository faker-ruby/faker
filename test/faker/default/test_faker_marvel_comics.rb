# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMarvelComics < Test::Unit::TestCase
  def setup
    @tester = Faker::MarvelComics
    Faker::Config.locale = nil
  end

  def test_hero
    assert @tester.hero.match(/\w+/)
  end

  def test_heroine
    assert @tester.heroine.match(/\w+/)
  end

  def test_villain
    assert @tester.villain.match(/\w+/)
  end

  def test_name
    assert @tester.name.match(/\w+/)
  end
end
