# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBlood < Test::Unit::TestCase
  def setup
    @tester = Faker::Blood
  end

  def test_type
    assert @tester.group.match(/[ABO]{1,2}/i)
  end

  def test_rh_factor
    assert @tester.group.match(/[+-]/i)
  end

  def test_group
    assert @tester.group.match(/[ABO]{1,2}[+-]/i)
  end
end
