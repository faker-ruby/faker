# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCat < Test::Unit::TestCase
  def setup
    @tester = Faker::Creature::Cat
  end

  def test_name
    assert @tester.name.match(/\w+\.?/)
  end

  def test_breed
    assert @tester.breed.match(/\w+\.?/)
  end

  def test_registry
    assert @tester.registry.match(/\w+\.?/)
  end
end
