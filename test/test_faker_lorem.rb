require File.dirname(__FILE__) + '/test_helper.rb'

class TestFakerLorem < Test::Unit::TestCase

  def setup
    @tester = Faker::Lorem
    @standard_wordlist = I18n.translate('faker.lorem.words')
    @complete_wordlist = 
      @standard_wordlist + I18n.translate('faker.lorem.supplemental')
  end
  
  # Words delivered by a standard request should be on the standard wordlist.
  def test_standard_words
    @words = @tester.words(1000)
    @words.each {|w| assert @standard_wordlist.include?(w) }
  end

  # Words requested from the supplemental list should all be in that list.
  def test_supplemental_words
    @words = @tester.words(10000, true)
    @words.each {|w| assert @complete_wordlist.include?(w) }
  end
end
