# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCurrency < Test::Unit::TestCase
  def setup
    @tester = Faker::Currency
  end

  def test_name
    assert_match(/[\w' ]+/, @tester.name)
  end

  def test_code
    assert_match(/[A-Z]{3}/, @tester.code)
  end

  def test_symbol
    assert_instance_of String, @tester.symbol
  end
end
