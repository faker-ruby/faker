# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerPokemon < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Pokemon
  end

  def test_name
    assert_match(/\w+/, @tester.name)
  end

  def test_location
    assert_match(/\w+/, @tester.location)
  end

  def test_move
    assert_match(/\w+/, @tester.move)
  end
end
