require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')
require 'minitest/mock'

class TestFakerBoolean < Test::Unit::TestCase
  def setup
    @tester = Faker::Boolean
  end

  def test_boolean
    assert [true, false].include?(@tester.boolean)
  end
end
