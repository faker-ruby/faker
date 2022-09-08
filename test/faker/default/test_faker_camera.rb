# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCamera < Test::Unit::TestCase
  def setup
    @tester = Faker::Camera
  end

  def test_brand
    assert_match(/\w+/, @tester.brand)
  end

  def test_model
    assert_match(/\w+/, @tester.model)
  end

  def test_brand_with_model
    assert_match(/\w+/, @tester.brand_with_model)
  end
end
