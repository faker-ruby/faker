# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAncient < Test::Unit::TestCase
  def setup
    @tester = Faker::Ancient
  end

  def test_god
    assert_match @tester.god, /\w+/
  end

  def test_primordial
    assert_match @tester.primordial, /\w+/
  end

  def test_titan
    assert_match @tester.titan, /\w+/
  end

  def test_hero
    assert_match @tester.hero, /\w+/
  end
end
