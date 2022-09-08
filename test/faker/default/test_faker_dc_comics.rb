# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDcComics < Test::Unit::TestCase
  def setup
    @tester = Faker::DcComics
  end

  def test_hero
    assert_match(/\w+/, @tester.hero)
  end

  def test_heroine
    assert_match(/\w+/, @tester.heroine)
  end

  def test_villain
    assert_match(/\w+/, @tester.villain)
  end

  def test_name
    assert_match(/\w+/, @tester.name)
  end

  def test_title
    assert_match(/(\w+\.? ?){2,3}/, @tester.title)
  end
end
