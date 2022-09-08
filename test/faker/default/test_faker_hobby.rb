# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHobby < Test::Unit::TestCase
  def setup
    @tester = Faker::Hobby
  end

  def test_flexible_key
    assert_equal(:hobby, @tester.flexible_key)
  end

  def test_activity
    assert_match(/\w+/, @tester.activity)
  end
end
