# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerComposite < Test::Unit::TestCase
  def setup
    @tester = Faker::Composite.new(Faker::Creature::Dog, Faker::Bank, Faker::Games::Pokemon)
  end

  # Common method should return expected responce
  def test_common_method
    assert_match(/\w+/, @tester.name)
  end

  # Methods not belonging to all Generators should raise exception
  def test_uncommon_method
    assert_raise NoMethodError do
      @tester.account_number
    end
  end
end
