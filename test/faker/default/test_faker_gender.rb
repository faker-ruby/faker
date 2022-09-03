# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGender < Test::Unit::TestCase
  def setup
    @tester = Faker::Gender
  end

  def test_type
    assert_match @tester.type, /\w+/
  end

  def test_binary_type
    assert_match @tester.binary_type, /\w+/
  end

  def test_short_binary_type
    assert_match @tester.short_binary_type, /f|m/
  end
end
