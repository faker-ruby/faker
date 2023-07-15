# frozen_string_literal: true

require_relative '../../test_helper'

class TestChileRut < Test::Unit::TestCase
  def setup
    @tester = Faker::ChileRut
  end

  def test_full_rut
    assert_equal('6-k', @tester.full_rut(min_rut: 6, fixed: true))
    assert_equal('8-6', @tester.full_rut(min_rut: 8, max_rut: 8))
    assert_equal('11.111.111-1', @tester.full_rut(min_rut: 11_111_111, max_rut: 11_111_111, formatted: true))
    assert_equal('30686957-4', @tester.full_rut(min_rut: 30_686_957, fixed: true))
  end

  def test_rut_length
    refute_empty @tester.rut.to_s
    assert @tester.rut.to_s.length <= 8
  end

  def test_rut_min_max
    assert_equal(7, @tester.rut(min_rut: 7, max_rut: 7))
  end

  # We need to set specific rut before testing the check digit
  # since the whole idea of the method revolves around calculating
  # the check digit for that specific rut.
  def test_check_digit
    assert_equal(30_686_957, @tester.rut(min_rut: 30_686_957, fixed: true))
    assert_equal('4', @tester.dv)
  end

  def test_full_formatted_rut
    assert_equal('30.686.957', @tester.full_rut(min_rut: 30_686_957, fixed: true, formatted: true).split('-')[0])
    assert_equal('4', @tester.dv)
  end
end
