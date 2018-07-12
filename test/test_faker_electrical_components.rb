# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerElectricalComponents < Test::Unit::TestCase
  def setup
    @tester = Faker::ElectricalComponents
  end

  def test_active
    assert @tester.active.match(/\w+/)
  end

  def test_passive
    assert @tester.passive.match(/\w+/)
  end

  def test_electromechanical
    assert @tester.electromechanical.match(/\w+/)
  end
end
