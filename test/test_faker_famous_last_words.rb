require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerFamousLastWords < Test::Unit::TestCase
  def setup
    @tester = Faker::FamousLastWords
  end

  def test_name
    assert @tester.last_words.match(/\w+/)
  end
end
