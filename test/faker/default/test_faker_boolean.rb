# frozen_string_literal: true

require_relative '../../test_helper'
require 'minitest/mock'

class TestFakerBoolean < Test::Unit::TestCase
  def setup
    @tester = Faker::Boolean
  end

  def test_boolean
    assert_includes [true, false], @tester.boolean
  end
end
