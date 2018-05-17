require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerMichaelScott < Test::Unit::TestCase
  def setup
    @tester = Faker::MichaelScott
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
