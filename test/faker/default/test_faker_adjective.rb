# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAdjective < Test::Unit::TestCase
  def setup
    @tester = Faker::Adjective
  end

  def test_positive
    assert_match(/\w+/, @tester.positive)
  end

  def test_negative
    assert_match(/\w+/, @tester.negative)
  end
end
