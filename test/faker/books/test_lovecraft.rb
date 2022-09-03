# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBooksLovecraft < Test::Unit::TestCase
  def setup
    @tester = Faker::Books::Lovecraft
    @wordlist = I18n.translate('faker.lovecraft.words')
  end

  # Words delivered by this request should be on the wordlist.
  def test_words
    @words = @tester.words(number: 1000)
    @words.each { |w| assert_includes @wordlist, w }
  end

  # Words should not return any word with spaces
  def test_words_without_spaces
    @words = @tester.words(number: 1000)
    @words.each { |w| refute_match w, /\s/ }
  end

  # Faker::Lovecraft.word generates random word from wordlist
  def test_word
    1000.times { assert_includes @wordlist, @tester.word }
  end

  # Word should not return any word with spaces
  def test_word_without_spaces
    1000.times { refute_match @tester.word, /\s/ }
  end

  def test_exact_count_param
    assert_equal(2, @tester.words(number: 2).length)
    assert_equal(2, @tester.sentences(number: 2).length)
    assert_equal(2, @tester.paragraphs(number: 2).length)
  end

  def test_range_count_param
    ws = @tester.words(number: 2..5)
    ss = @tester.sentences(number: 2..5)
    ps = @tester.paragraphs(number: 2..5)

    assert(ws.length >= 2 && ws.length <= 5)
    assert(ss.length >= 2 && ss.length <= 5)
    assert(ps.length >= 2 && ps.length <= 5)
  end

  def test_array_count_param
    ws = @tester.words(number: [1, 4])
    ss = @tester.sentences(number: [1, 4])
    ps = @tester.paragraphs(number: [1, 4])

    assert(ws.length == 1 || ws.length == 4)
    assert(ss.length == 1 || ss.length == 4)
    assert(ps.length == 1 || ps.length == 4)
  end

  def test_words_with_large_count_params
    exact = @tester.words(number: 500)
    range = @tester.words(number: 250..500)
    array = @tester.words(number: [250, 500])

    assert_equal(500, exact.length)
    assert(range.length >= 250 && range.length <= 500)
    assert(array.length == 250 || array.length == 500)
  end

  def test_sentence_with_open_compounds_allowed
    1000.times do
      sentence = @tester.sentence(word_count: 5, random_words_to_add: 0, open_compounds_allowed: true)
      assert(sentence.split.length >= 5)
    end
  end

  # Sentence should not contain any open compounds
  def test_sentence_without_open_compounds_allowed
    1000.times do
      sentence = @tester.sentence(word_count: 5, random_words_to_add: 0, open_compounds_allowed: false)
      assert_equal(5, sentence.split.length)
    end
  end

  def test_paragraph_char_count
    paragraph = @tester.paragraph_by_chars
    assert_equal(256, paragraph.length)
  end

  def test_tome
    assert_match @tester.tome, /\w/
  end

  def test_location
    assert_match @tester.location, /\w/
  end

  def test_deity
    assert_match @tester.deity, /\w/
  end

  def test_fhtagn
    assert_match @tester.fhtagn, /\w/
  end
end
