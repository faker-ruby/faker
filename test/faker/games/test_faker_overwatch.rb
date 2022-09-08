# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerOverwatch < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Overwatch
  end

  def test_hero
    assert_match(/\w+/, @tester.hero)
  end

  def test_location
    assert_match(/\w+/, @tester.location)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end
end
