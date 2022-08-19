# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHobby < Test::Unit::TestCase
  def setup
    @tester = Faker::Hobby
  end

  def test_flexible_key
    assert @tester.flexible_key == :hobby
  end

  def test_activity
    assert @tester.activity.match(/\w+/)
  end
end
