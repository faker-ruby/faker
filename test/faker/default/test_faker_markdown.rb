# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMarkdown < Test::Unit::TestCase
  def setup
    @tester = Faker::Markdown
    @random_method = random_method
  end

  def test_headers
    test_trigger = @tester.headers.split

    assert(test_trigger.length == 2)
    assert(test_trigger.first.include?('#'))
  end

  def test_emphasis
    test_trigger = @tester.emphasis.chars

    assert(test_trigger.to_set.intersect?(['_', '~', '*', '**'].to_set))
  end

  def test_ordered_list
    test_trigger = @tester.ordered_list.split("\n")

    test_trigger.each do |line|
      assert_instance_of(Integer, line[0].to_i)
    end
  end

  def test_unordered_list
    test_trigger = @tester.unordered_list.split("\n")

    test_trigger.each do |line|
      assert_equal('*', line[0])
    end
  end

  def test_inline_code
    test_trigger = @tester.inline_code.chars

    assert_equal(test_trigger.first, '`')
    assert_equal(test_trigger.last, '`')
  end

  def test_block_code
    test_trigger = @tester.block_code.chars

    assert_equal(test_trigger[0], '`')
    assert_equal(test_trigger[1], '`')
    assert_equal(test_trigger[2], '`')
    assert_equal(test_trigger[-1], '`')
    assert_equal(test_trigger[-2], '`')
    assert_equal(test_trigger[-3], '`')
  end

  def test_table
    test_trigger = @tester.table.split("\n")

    test_trigger.each do |table_data|
      assert_instance_of(String, table_data)
    end
    assert_equal(test_trigger.length, 4)
    assert_equal(test_trigger[1], '---- | ---- | ----')
  end

  def test_random
    test_trigger = @tester.random

    assert_instance_of(String, test_trigger)
  end

  def test_random_with_a_randomly_excluded_method
    excluded_method = @random_method
    test_trigger = @tester.random(excluded_method)

    20.times do
      refute_equal(test_trigger, @tester.send(excluded_method))
    end
  end

  def test_sandwich
    test_trigger = @tester.sandwich

    test_array = []
    test_trigger.each_line { |substr| test_array << substr }

    assert(test_array.length >= 3)

    assert(test_array[0].split.length == 2)
    assert(test_array[0].split.first.include?('#'))

    assert_instance_of(String, test_array[0])
    assert_instance_of(String, test_array[1])
    assert_instance_of(String, test_array[2])
  end

  private

  def random_method
    method_list = Faker::Markdown.public_methods(false) - Faker::Base.methods
    method_list[rand(0..method_list.length - 1)]
  end
end
