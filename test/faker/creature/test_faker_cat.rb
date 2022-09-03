# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCat < Test::Unit::TestCase
  def setup
    @tester = Faker::Creature::Cat
  end

  def test_name
    assert_match @tester.name, /\w+\.?/
  end

  def test_breed
    assert_match @tester.breed, /\w+\.?/
  end

  def test_registry
    assert_match @tester.registry, /\w+\.?/
  end
end
