require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerVehicle < Test::Unit::TestCase
  WORD_MATCH = /\w+\.?/

  def setup
    @tester = Faker::Vehicle
  end

  def test_vin
    vin = @tester.vin('11111111011111111')
    assert vin == '11111111111111111'
  end

  def test_manufacture
    assert_match WORD_MATCH, @tester.manufacture
  end

  def test_color
    assert_match WORD_MATCH, @tester.color
  end

  def test_transmission
    assert_match WORD_MATCH, @tester.transmission
  end

  def test_drive_type
    assert_match WORD_MATCH, @tester.drive_type
  end

  def test_flexible_key
    flexible_key = @tester.instance_variable_get("@flexible_key")
    assert flexible_key == :vehicle
  end
end
