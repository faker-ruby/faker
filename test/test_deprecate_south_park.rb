# frozen_string_literal: true

require_relative 'test_helper'

class TestDeprecateSouthPark < Test::Unit::TestCase
  def setup
    @tester = Faker::SouthPark
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end

class TestDeprecateMoviesSouthPark < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::SouthPark
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
