# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCat < Test::Unit::TestCase
  def setup
    @tester = Faker::Creature::Cat
  end

  def test_name
    assert_match(/\w+\.?/, @tester.name)
  end

  def test_breed
    assert_match(/\w+\.?/, @tester.breed)
  end

  def test_registry
    assert_match(/\w+\.?/, @tester.registry)
  end
end
