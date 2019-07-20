# frozen_string_literal: true

require_relative '../../test_helper'

class TestAircraft < Test::Unit::TestCase
  def setup
    @tester = Faker::Aircraft
  end

  def test_manufacturer
    assert @tester.manufacturer.match(/\w+/)
  end

  def test_model
    assert @tester.model.match(/\w+/)
    assert @tester.model(@tester.manufacturer).match(/\w+/)
  end
end
