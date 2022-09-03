# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBlood < Test::Unit::TestCase
  def setup
    @tester = Faker::Blood
  end

  def test_type
    assert_match @tester.type, /^(AB|A|B|O)$/
  end

  def test_rh_factor
    assert_match @tester.rh_factor, /[+-]/
  end

  def test_group
    assert_match @tester.group, /^(AB|A|B|O)[+-]$/
  end
end
