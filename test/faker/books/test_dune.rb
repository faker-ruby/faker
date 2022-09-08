# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBooksDune < Test::Unit::TestCase
  def setup
    @tester = Faker::Books::Dune
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_title
    assert_match(/\w+/, @tester.title)
  end

  def test_planet
    assert_match(/\w+/, @tester.planet)
  end

  def test_city
    assert_match(/\w+/, @tester.city)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end

  def test_saying
    assert_match(/\w+/, @tester.saying)
  end
end
