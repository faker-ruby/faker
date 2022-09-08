# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGender < Test::Unit::TestCase
  def setup
    @tester = Faker::Gender
  end

  def test_type
    assert_match(/\w+/, @tester.type)
  end

  def test_binary_type
    assert_match(/\w+/, @tester.binary_type)
  end

  def test_short_binary_type
    assert_match(/f|m/, @tester.short_binary_type)
  end
end
