# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerFantasyTolkien < Test::Unit::TestCase
  def setup
    @tester = Faker::Fantasy::Tolkien
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_location
    assert_match @tester.location, /\w+/
  end

  def test_race
    assert_match @tester.race, /\w+/
  end

  def test_poem
    assert_match @tester.poem, /\w+/
  end
end
