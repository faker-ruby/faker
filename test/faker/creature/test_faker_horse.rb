# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHorse < Test::Unit::TestCase
  def setup
    @tester = Faker::Creature::Horse
  end

  def test_name
    assert @tester.name.match(/\w+\.?/)
  end

  def test_breed
    assert @tester.breed.match(/\w+\.?/)
  end
end
