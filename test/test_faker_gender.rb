require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerGender < Test::Unit::TestCase
  def setup
    @tester = Faker::Gender
  end

  def test_type
    assert @tester.type.match(/\w+/)
  end

  def test_binary_type
    assert @tester.binary_type.match(/\w+/)
  end
end
