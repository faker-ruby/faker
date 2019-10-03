# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerFormulaOne < Test::Unit::TestCase
  def setup
    @tester = Faker::Sports::FormulaOne
  end

  def test_team
    assert @tester.team.match(/\w+/)
  end

  def test_driver
    assert @tester.driver.match(/\w+/)
  end

  def test_circuit
    assert @tester.circuit.match(/\w+/)
  end
end
