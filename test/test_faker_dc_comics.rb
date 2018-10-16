# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerDcComics < Test::Unit::TestCase
  def setup
    @tester = Faker::DcComics
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

  def test_title
    assert @tester.title.match(/(\w+\.? ?){2,3}/)
  end
end
