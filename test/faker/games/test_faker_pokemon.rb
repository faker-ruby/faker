# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerPokemon < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Pokemon
  end

  def test_name
    assert_match @tester.name, /\w+/
  end

  def test_location
    assert_match @tester.location, /\w+/
  end

  def test_move
    assert_match @tester.move, /\w+/
  end
end
