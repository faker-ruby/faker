# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerOverwatch < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Overwatch
  end

  def test_hero
    assert @tester.hero.match?(/\w+/)
  end

  def test_location
    assert @tester.location.match?(/\w+/)
  end

  def test_quote
    assert @tester.quote.match?(/\w+/)
  end
end
