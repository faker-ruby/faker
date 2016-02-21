require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')
require 'minitest/mock'

class TestFakerBoolean < Test::Unit::TestCase
  def setup
    @tester = Faker::Boolean
  end

  def test_boolean
    assert [true, false].include?(@tester.boolean)
  end

  def test_distribution
    true_ratio = rand.round(1)
    true_counter = 0

    10000.times do
      true_counter += 1 if @tester.boolean(true_ratio)
    end

    assert_in_delta true_ratio, (true_counter/10000.0), 0.01
  end
end
