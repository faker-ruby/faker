# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHorse < Test::Unit::TestCase
  def setup
    @tester = Faker::Creature::Horse
  end

  def test_name
    assert_match @tester.name, /\w+\.?/
  end

  def test_breed
    assert_match @tester.breed, /\w+\.?/
  end
end
