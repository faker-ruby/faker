# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAncient < Test::Unit::TestCase
  def setup
    @tester = Faker::Ancient
  end

  def test_god
    assert_match(/\w+/, @tester.god)
  end

  def test_primordial
    assert_match(/\w+/, @tester.primordial)
  end

  def test_titan
    assert_match(/\w+/, @tester.titan)
  end

  def test_hero
    assert_match(/\w+/, @tester.hero)
  end
end
