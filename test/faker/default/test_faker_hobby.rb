# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHobby < Test::Unit::TestCase
  def setup
    @tester = Faker::Hobby
  end

  def test_flexible_key
    flexible_key = @tester.instance_variable_get('@flexible_key')

    assert flexible_key == :hobby
  end

  def test_activity
    assert @tester.activity.match(/\w+/)
  end
end
