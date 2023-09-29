# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDevice < Test::Unit::TestCase
  def setup
    @tester = Faker::Device
  end

  def test_model_name
    assert_match(/\w+/, @tester.model_name)
  end

  def test_platform
    assert_match(/\w+/, @tester.platform)
  end

  def test_version
    assert_predicate @tester.version, :positive?
    assert_operator @tester.version, :<=, 1000
  end

  def test_build_number
    assert_predicate @tester.build_number, :positive?
    assert_operator @tester.build_number, :<=, 500
  end

  def test_manufacturer
    assert_match(/\w+/, @tester.manufacturer)
  end

  def test_serial
    assert_match(/\w+/, @tester.serial)
  end
end
