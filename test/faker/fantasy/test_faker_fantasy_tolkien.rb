# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerFantasyTolkien < Test::Unit::TestCase
  def setup
    @tester = Faker::Fantasy::Tolkien
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_location
    assert_match(/\w+/, @tester.location)
  end

  def test_race
    assert_match(/\w+/, @tester.race)
  end

  def test_poem
    assert_match(/\w+/, @tester.poem)
  end
end
