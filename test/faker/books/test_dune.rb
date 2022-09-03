# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBooksDune < Test::Unit::TestCase
  def setup
    @tester = Faker::Books::Dune
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_title
    assert_match @tester.title, /\w+/
  end

  def test_planet
    assert_match @tester.planet, /\w+/
  end

  def test_city
    assert_match @tester.city, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end

  def test_saying
    assert_match @tester.saying, /\w+/
  end
end
