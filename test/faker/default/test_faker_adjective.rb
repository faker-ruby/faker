# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAdjective < Test::Unit::TestCase
  def setup
    @tester = Faker::Adjective
  end

  def test_positive
    assert @tester.positive.match(/\w+/)
  end

  def test_negative
    assert @tester.negative.match(/\w+/)
  end
end
