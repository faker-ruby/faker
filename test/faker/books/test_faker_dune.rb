# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDune < Test::Unit::TestCase
  def setup
    @tester = Faker::Books::Dune
  end

  def test_character
    assert @tester.character.match?(/\w+/)
  end

  def test_title
    assert @tester.title.match?(/\w+/)
  end

  def test_planet
    assert @tester.planet.match?(/\w+/)
  end

  def test_random_quote
    assert @tester.quote.match?(/\w+/)
  end

  # test good match
  def test_random_character_quote
    assert @tester.quote(character: 'paul').match?(/\w+/)
  end

  # test error on no match
  def test_invalid_quote
    assert_raise ArgumentError do
      @tester.quote(character: 'Luke Skywalker')
    end
  end

  def test_random_saying
    assert @tester.saying.match?(/\w+/)
  end

  # test good match
  def test_random_source_saying
    assert @tester.saying(source: 'fremen').match?(/\w+/)
  end

  # test error on no match
  def test_invalid_saying
    assert_raise ArgumentError do
      @tester.saying(source: 'Ewoks')
    end
  end
end
