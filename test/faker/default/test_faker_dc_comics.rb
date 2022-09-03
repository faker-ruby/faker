# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDcComics < Test::Unit::TestCase
  def setup
    @tester = Faker::DcComics
  end

  def test_hero
    assert_match @tester.hero, /\w+/
  end

  def test_heroine
    assert_match @tester.heroine, /\w+/
  end

  def test_villain
    assert_match @tester.villain, /\w+/
  end

  def test_name
    assert_match @tester.name, /\w+/
  end

  def test_title
    assert_match @tester.title, /(\w+\.? ?){2,3}/
  end
end
