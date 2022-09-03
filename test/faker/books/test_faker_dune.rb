# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDune < Test::Unit::TestCase
  def setup
    @tester = Faker::Books::Dune
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_title
    assert_match @tester.title, /\w+/
  end

  def test_city
    assert_match @tester.city, /\w+/
  end

  def test_planet
    assert_match @tester.planet, /\w+/
  end

  def test_random_quote
    assert_match @tester.quote, /\w+/
  end

  # test good match
  def test_random_character_quote
    assert_match @tester.quote(character: 'paul'), /\w+/
  end

  # test error on no match
  def test_invalid_quote
    assert_raise ArgumentError do
      @tester.quote(character: 'Luke Skywalker')
    end
  end

  def test_random_saying
    assert_match @tester.saying, /\w+/
  end

  # test good match
  def test_random_source_saying
    assert_match @tester.saying(source: 'fremen'), /\w+/
  end

  # test error on no match
  def test_invalid_saying
    assert_raise ArgumentError do
      @tester.saying(source: 'Ewoks')
    end
  end
end
