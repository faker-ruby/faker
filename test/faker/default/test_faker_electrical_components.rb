# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerElectricalComponents < Test::Unit::TestCase
  def setup
    @tester = Faker::ElectricalComponents
  end

  def test_active
    assert_match(/\w+/, @tester.active)
  end

  def test_passive
    assert_match(/\w+/, @tester.passive)
  end

  def test_electromechanical
    assert_match(/\w+/, @tester.electromechanical)
  end
end
