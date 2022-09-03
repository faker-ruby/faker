# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerOverwatch < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Overwatch
  end

  def test_hero
    assert_match @tester.hero, /\w+/
  end

  def test_location
    assert_match @tester.location, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end
end
