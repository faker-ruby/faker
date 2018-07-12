# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerLorem < Test::Unit::TestCase
  def setup
    @tester = Faker::Lorem
    @standard_wordlist = I18n.translate('faker.lorem.words')
    @complete_wordlist =
      @standard_wordlist + I18n.translate('faker.lorem.supplemental')
  end

  def test_character
    assert @tester.character.length == 1
  end

  def test_character_type
    assert @tester.character.class == String
  end

  def test_characters
    assert @tester.characters.length == 255
  end

  def test_characters_negatives
    assert_equal '', @tester.characters(-1)
    assert_equal '', @tester.characters((-2..-1))
    assert_equal '', @tester.characters([-1, -2])
  end

  def test_characters_with_args
    100.times { assert @tester.characters(500).length == 500 }
  end

  # Words delivered by a standard request should be on the standard wordlist.
  def test_standard_words
    @words = @tester.words(1000)
    @words.each { |w| assert @standard_wordlist.include?(w) }
  end

  # Words requested from the supplemental list should all be in that list.
  def test_supplemental_words
    @words = @tester.words(10_000, true)
    @words.each { |w| assert @complete_wordlist.include?(w) }
  end

  # Faker::Lorem.word generates random word from standart wordlist
  def test_word
    @tester = Faker::Lorem
    @standard_wordlist = I18n.translate('faker.lorem.words')
    100.times { assert @standard_wordlist.include?(@tester.word) }
  end

  def test_exact_sentence_word_count
    assert_equal 2, @tester.sentence(2, false, 0).split(' ').length
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

    assert(cs.length >= 2 && cs.length <= 5)
    assert(ws.length >= 2 && ws.length <= 5)
    assert(ss.length >= 2 && ss.length <= 5)
    assert(ps.length >= 2 && ps.length <= 5)
  end

  def test_exclusive_range_count_param
    cs = @tester.characters(2...3)
    ws = @tester.words(2...3)
    ss = @tester.sentences(2...3)
    ps = @tester.paragraphs(2...3)

    assert_equal(2, cs.length)
    assert_equal(2, ws.length)
    assert_equal(2, ss.length)
    assert_equal(2, ps.length)
  end

  def test_array_count_param
    cs = @tester.characters([1, 4])
    ws = @tester.words([1, 4])
    ss = @tester.sentences([1, 4])
    ps = @tester.paragraphs([1, 4])

    assert(cs.length == 1 || cs.length == 4)
    assert(ws.length == 1 || ws.length == 4)
    assert(ss.length == 1 || ss.length == 4)
    assert(ps.length == 1 || ps.length == 4)
  end

  def test_words_with_large_count_params
    exact = @tester.words(500)
    range = @tester.words(250..500)
    array = @tester.words([250, 500])

    assert(exact.length == 500)
    assert(range.length >= 250 && range.length <= 500)
    assert(array.length == 250 || array.length == 500)
  end

  def test_multibyte
    assert @tester.multibyte.is_a? String
  end

  def test_paragraph_char_count
    paragraph = @tester.paragraph_by_chars(256)
    assert(paragraph.length == 256)
  end
end
