# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCamera < Test::Unit::TestCase
  def setup
    @tester = Faker::Camera
  end

  def test_brand
    assert_match @tester.brand, /\w+/
  end

  def test_model
    assert_match @tester.model, /\w+/
  end

  def test_brand_with_model
    assert_match @tester.brand_with_model, /\w+/
  end
end
