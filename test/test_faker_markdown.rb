require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerMarkdown < Test::Unit::TestCase
  def setup
    @tester = Faker::Markdown
  end

  def test_headers
    test_trigger = @tester.headers.split(' ')

    assert(test_trigger.length == 2)
    assert(test_trigger.first.include?('#'))
  end

  def test_emphasis
    test_trigger = @tester.emphasis.split('')

    assert(test_trigger.to_set.intersect?(["_", "~", "*", "**"].to_set))
  end

  def test_ordered_list
    test_trigger = @tester.ordered_list.split("\n")

    test_trigger.each do |line|
      assert_instance_of(Fixnum, line[0].to_i)
    end
  end

  def test_unordered_list
    test_trigger = @tester.unordered_list.split("\n")

    test_trigger.each do |line|
      assert_equal("*", line[0])
    end
  end

  def test_inline_code
    test_trigger = @tester.inline_code.split('')

    assert_equal(test_trigger.first, "`")
    assert_equal(test_trigger.last, "`")
  end

  def test_block_code
    test_trigger = @tester.block_code.split('')

    assert_equal(test_trigger[0], "`")
    assert_equal(test_trigger[1], "`")
    assert_equal(test_trigger[2], "`")
    assert_equal(test_trigger[-1], "`")
    assert_equal(test_trigger[-2], "`")
    assert_equal(test_trigger[-3], "`")
  end

  def test_table
    test_trigger = @tester.table.split("\n")

    test_trigger.each do |table_data|
      assert_instance_of(String, table_data)
    end
    assert_equal(test_trigger.length, 4)
    assert_equal(test_trigger[1], "---- | ---- | ----")
  end

  def test_random
    test_trigger = @tester.random

    assert_instance_of(String, test_trigger)
  end

end
