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

  def test_exact_count_param
    assert(@tester.characters(2).length == 2)
    assert(@tester.words(2).length == 2)
    assert(@tester.sentences(2).length == 2)
    assert(@tester.paragraphs(2).length == 2)
  end

  def test_range_count_param
    cs = @tester.characters(2..5)
    ws = @tester.words(2..5)
    ss = @tester.sentences(2..5)
    ps = @tester.paragraphs(2..5)

    assert(2 <= cs.length && cs.length <= 5)
    assert(2 <= ws.length && ws.length <= 5)
    assert(2 <= ss.length && ss.length <= 5)
    assert(2 <= ps.length && ps.length <= 5)
  end
end
