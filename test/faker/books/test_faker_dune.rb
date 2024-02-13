# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDune < Test::Unit::TestCase
  def setup
    @tester = Faker::Books::Dune
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_title
    assert_match(/\w+/, @tester.title)
  end

  def test_city
    assert_match(/\w+/, @tester.city)
  end

  def test_planet
    assert_match(/\w+/, @tester.planet)
  end

  def test_random_quote
    assert_match(/\w+/, @tester.quote)
  end

  # test good match
  def test_random_character_quote
    assert_match(/\w+/, @tester.quote(character: 'paul'))
  end

  # test error on no match
  def test_invalid_quote
    assert_raise ArgumentError do
      @tester.quote(character: 'Luke Skywalker')
    end
  end

  def test_random_saying
    assert_match(/\w+/, @tester.saying)
  end

  # test good match
  def test_random_source_saying
    assert_match(/\w+/, @tester.saying(source: 'fremen'))
  end

  # test error on no match
  def test_invalid_saying
    assert_raise ArgumentError do
      @tester.saying(source: 'Ewoks')
    end
  end
end
