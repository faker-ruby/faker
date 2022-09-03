# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDevice < Test::Unit::TestCase
  def setup
    @tester = Faker::Device
  end

  def test_model_name
    assert_match @tester.model_name, /\w+/
  end

  def test_platform
    assert_match @tester.platform, /\w+/
  end

  def test_version
    assert_predicate @tester.version, :positive?
    assert @tester.version <= 1000
  end

  def test_build_number
    assert_predicate @tester.build_number, :positive?
    assert @tester.build_number <= 500
  end

  def test_manufacturer
    assert_match @tester.manufacturer, /\w+/
  end

  def test_serial
    assert_match @tester.serial, /\w+/
  end
end
