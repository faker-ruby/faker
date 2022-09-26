# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMyst < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Myst
  end

  def test_game
    assert_match(/\w+/, @tester.game)
  end

  def test_creature
    assert_match(/\w+/, @tester.creature)
  end

  def test_age
    assert_match(/\w+/, @tester.age)
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end
end
