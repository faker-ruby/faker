# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerRestaurant < Test::Unit::TestCase
  def setup
    @tester = Faker::Restaurant
  end

  def test_name
    assert_kind_of String, @tester.name
  end

  def test_type
    assert_kind_of String, @tester.type
  end

  def test_description
    assert_kind_of String, @tester.description
  end

  def test_review
    assert_kind_of String, @tester.review
  end
end
