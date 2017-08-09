require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerApp < Test::Unit::TestCase
  def setup
    @tester = Faker::PhoneNumber
  end

  def test_calling_code
    assert @tester.calling_code.match(/\+\d+/)
  end

end
