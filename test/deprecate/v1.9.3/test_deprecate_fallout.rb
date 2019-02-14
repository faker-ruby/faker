# frozen_string_literal: true

require_relative '../../test_helper'

class TestDeprecateFallout < Test::Unit::TestCase
  def setup
    @tester = Faker::Fallout
  end

  def test_hero
    assert @tester.character.match(/\w+/)
  end

  def test_faction
    assert @tester.faction.match(/\w+/)
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
