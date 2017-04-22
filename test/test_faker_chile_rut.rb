require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestChileRUT < Test::Unit::TestCase

  def setup
    @tester = Faker::ChileRUT
  end

  def test_full_RUT
    assert @tester.full_RUT(6, true) == "6-k"
    assert @tester.full_RUT(30_686_957, true) == "30686957-4"
  end

  def test_RUT_length
    assert @tester.RUT.to_s.length > 0
    assert @tester.RUT.to_s.length <= 8
  end

  # We need to set specific RUT before testing the check digit
  # since the whole idea of the method revolves around calculating
  # the check digit for that specific RUT.
  def test_check_digit
    assert @tester.RUT(30_686_957, true) == 30686957
    assert @tester.dv == "4"
  end
end
