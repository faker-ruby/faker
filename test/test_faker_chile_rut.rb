# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestChileRut < Test::Unit::TestCase
  def setup
    @tester = Faker::ChileRut
  end

  def test_full_rut
    assert @tester.full_rut(6, true) == '6-k'
    assert @tester.full_rut(30_686_957, true) == '30686957-4'
  end

  def test_rut_length
    assert !@tester.rut.to_s.empty?
    assert @tester.rut.to_s.length <= 8
  end

  # We need to set specific rut before testing the check digit
  # since the whole idea of the method revolves around calculating
  # the check digit for that specific rut.
  def test_check_digit
    assert @tester.rut(30_686_957, true) == 30_686_957
    assert @tester.dv == '4'
  end
end
