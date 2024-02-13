# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHorse < Test::Unit::TestCase
  def setup
    @tester = Faker::Creature::Horse
  end

  def test_name
    assert_match(/\w+\.?/, @tester.name)
  end

  def test_breed
    assert_match(/\w+\.?/, @tester.breed)
  end
end
