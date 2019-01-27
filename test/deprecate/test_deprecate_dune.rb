# frozen_string_literal: true

require_relative '../test_helper'

class TestDeprecateDune < Test::Unit::TestCase
  def setup
    @tester = Faker::Dune
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_title
    assert @tester.title.match(/\w+/)
  end

  def test_planet
    assert @tester.planet.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end

  def test_saying
    assert @tester.saying.match(/\w+/)
  end
end
