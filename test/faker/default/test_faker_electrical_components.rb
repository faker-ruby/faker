# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerElectricalComponents < Test::Unit::TestCase
  def setup
    @tester = Faker::ElectricalComponents
  end

  def test_active
    assert_match @tester.active, /\w+/
  end

  def test_passive
    assert_match @tester.passive, /\w+/
  end

  def test_electromechanical
    assert_match @tester.electromechanical, /\w+/
  end
end
