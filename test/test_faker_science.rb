require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerScience < Test::Unit::TestCase
  def setup
    @tester = Faker::Science
  end

  def test_element
    assert @tester.element.match(/\w+/)
  end

  def test_scientist
    assert @tester.scientist.match(/\w+/)
  end

end
