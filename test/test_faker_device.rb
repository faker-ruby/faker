require_relative 'test_helper'

class TestFakerDevice < Test::Unit::TestCase
  def setup
    @tester = Faker::Device
  end

  def test_model_name
    assert @tester.model_name.match(/\w+/)
  end

  def test_platform
    assert @tester.platform.match(/\w+/)
  end

  def test_version
    assert @tester.version > 0
    assert @tester.version <= 1000
  end

  def test_build_number
    assert @tester.build_number > 0
    assert @tester.build_number <= 500
  end

  def test_manufacturer
    assert @tester.manufacturer.match(/\w+/)
  end

  def test_serial
    assert @tester.serial.match(/\w+/)
  end
end
