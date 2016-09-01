require File.dirname(__FILE__) + '/test_helper.rb'

class TestFakerHodor < Test::Unit::TestCase

  def setup
    @tester = Faker::Hodor
    @standard_wordlist = ['hodor']
  end

  # Words delivered by a standard request should be on the standard wordlist.
  def test_standard_words
    @words = @tester.words(42)
    @words.each {|w| assert @standard_wordlist.include?(w) }
  end

  # Faker::Hodor.word generates random word from standart wordlist
  def test_word
    42.times { assert @standard_wordlist.include?(@tester.word) }
  end

  def test_exact_count_param
    assert(@tester.words(2).length == 2)
    assert(@tester.sentences(2).length == 2)
    assert(@tester.paragraphs(2).length == 2)
  end

  def test_range_count_param
    ws = @tester.words(2..5)
    ss = @tester.sentences(2..5)
    ps = @tester.paragraphs(2..5)

    assert(2 <= ws.length && ws.length <= 5)
    assert(2 <= ss.length && ss.length <= 5)
    assert(2 <= ps.length && ps.length <= 5)
  end

  def test_array_count_param
    ws = @tester.words([1,4])
    ss = @tester.sentences([1,4])
    ps = @tester.paragraphs([1,4])

    assert(ws.length == 1 || ws.length == 4)
    assert(ss.length == 1 || ss.length == 4)
    assert(ps.length == 1 || ps.length == 4)
  end

  def test_words_with_large_count_params
    exact = @tester.words(500)
    range = @tester.words(250..500)
    array = @tester.words([250, 500])

    assert(exact.length == 500)
    assert(250 <= range.length && range.length <= 500)
    assert(array.length == 250 || array.length == 500)
  end

  def test_hodor_speaks_hodor
    assert @tester.word == 'hodor'
    assert @tester.words(3).join(' ') == 'hodor hodor hodor'
    assert @tester.sentence(3, 0) == 'Hodor hodor hodor.'
  end
end
