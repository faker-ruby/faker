require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerApp < Test::Unit::TestCase
  def setup
    @tester = Faker::App
  end

  def test_name
    assert @tester.author.match(/(\w+\.? ?){2,3}/)
  end

end
