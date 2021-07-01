# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCamera < Test::Unit::TestCase
  def setup
    @tester = Faker::Camera
  end

  def test_brand
    assert @tester.brand.match(/\w+/)
  end

  def test_model
    assert @tester.model.match(/\w+/)
  end

  def test_brand_with_model
    assert @tester.brand_with_model.match(/\w+/)
  end
end
