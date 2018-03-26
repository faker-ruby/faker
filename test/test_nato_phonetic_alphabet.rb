require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerNatoPhoneticAlphabet < Test::Unit::TestCase
  def setup
    @tester = Faker::NatoPhoneticAlphabet
  end

  def test_code_word
    assert @tester.code_word.match(/\w+/)
  end

end
