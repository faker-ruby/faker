require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerVForVendetta < Test::Unit::TestCase
  def setup
    @tester = Faker::VForVendetta
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_speech
    assert @tester.speech.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
