# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerRestaurant < Test::Unit::TestCase
  def setup
    @tester = Faker::Restaurant
  end

  def test_name
    assert @tester.name.is_a?(String)
  end

  def test_type
    assert @tester.type.is_a?(String)
  end

  def test_description
    assert @tester.description.is_a?(String)
  end

  def test_review
    assert @tester.review.is_a?(String)
  end
end
