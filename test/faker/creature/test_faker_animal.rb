# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCreatureAnimal < Test::Unit::TestCase
  def setup
    @tester = Faker::Creature::Animal
  end

  def test_name
    assert @tester.name.match?(/\w+/)
  end
end
