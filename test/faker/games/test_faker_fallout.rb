# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerFallout < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Fallout
  end

  def test_hero
    assert_match(/\w+/, @tester.character)
  end

  def test_faction
    assert_match(/\w+/, @tester.faction)
  end

  def test_location
    assert_match(/\w+/, @tester.location)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end
end
