require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerSource < Test::Unit::TestCase
  def setup
    @tester = Faker::Source
  end

  def test_hello_world
    assert_instance_of String, @tester.hello_world
  end

  def test_print
    assert_instance_of String, @tester.print
  end

  def test_print_1_to_10
    assert_instance_of String, @tester.print_1_to_10
  end
end
