# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCurrency < Test::Unit::TestCase
  def setup
    @tester = Faker::Currency
  end

  def test_name
    assert_match @tester.name, /[\w' ]+/
  end

  def test_code
    assert_match @tester.code, /[A-Z]{3}/
  end

  def test_symbol
    assert_instance_of String, @tester.symbol
  end
end
