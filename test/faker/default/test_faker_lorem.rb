# frozen_string_literal: true

require_relative '../../test_helper'

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
    assert @tester.character.instance_of?(String)
  end

  def test_characters
    assert @tester.characters.length == 255
  end

  def test_characters_negatives
    assert_equal '', @tester.characters(number: -1)
    assert_equal '', @tester.characters(number: (-2..-1))
    assert_equal '', @tester.characters(number: [-1, -2])
  end

  def test_characters_with_args
    100.times { assert @tester.characters(number: 500).length == 500 }
  end

  # Words delivered by a standard request should be on the standard wordlist.
  def test_standard_words
    @words = @tester.words(number: 1000)
    @words.each { |w| assert @standard_wordlist.include?(w) }
  end

  # Words requested from the supplemental list should all be in that list.
  def test_supplemental_words
    @words = @tester.words(number: 10_000, supplemental: true)
    @words.each { |w| assert @complete_wordlist.include?(w) }
  end

  # Faker::Lorem.word generates random word from standart wordlist
  def test_word
    @tester = Faker::Lorem
    @standard_wordlist = I18n.translate('faker.lorem.words')
    100.times { assert @standard_wordlist.include?(@tester.word) }
  end

  def test_exact_sentence_word_count
    assert_equal 2, @tester.sentence(word_count: 2, supplemental: false, random_words_to_add: 0).split(' ').length
  end

  def test_exact_count_param
    assert(@tester.characters(number: 2).length == 2)
    assert(@tester.words(number: 2).length == 2)
    assert(@tester.sentences(number: 2).length == 2)
    assert(@tester.paragraphs(number: 2).length == 2)
  end

  def test_range_count_param
    cs = @tester.characters(number: 2..5)
    ws = @tester.words(number: 2..5)
    ss = @tester.sentences(number: 2..5)
    ps = @tester.paragraphs(number: 2..5)

    assert(cs.length >= 2 && cs.length <= 5)
    assert(ws.length >= 2 && ws.length <= 5)
    assert(ss.length >= 2 && ss.length <= 5)
    assert(ps.length >= 2 && ps.length <= 5)
  end

  def test_exclusive_range_count_param
    cs = @tester.characters(number: 2...3)
    ws = @tester.words(number: 2...3)
    ss = @tester.sentences(number: 2...3)
    ps = @tester.paragraphs(number: 2...3)

    assert_equal(2, cs.length)
    assert_equal(2, ws.length)
    assert_equal(2, ss.length)
    assert_equal(2, ps.length)
  end

  def test_array_count_param
    cs = @tester.characters(number: [1, 4])
    ws = @tester.words(number: [1, 4])
    ss = @tester.sentences(number: [1, 4])
    ps = @tester.paragraphs(number: [1, 4])

    assert(cs.length == 1 || cs.length == 4)
    assert(ws.length == 1 || ws.length == 4)
    assert(ss.length == 1 || ss.length == 4)
    assert(ps.length == 1 || ps.length == 4)
  end

  def test_words_with_large_count_params
    exact = @tester.words(number: 500)
    range = @tester.words(number: 250..500)
    array = @tester.words(number: [250, 500])

    assert(exact.length == 500)
    assert(range.length >= 250 && range.length <= 500)
    assert(array.length == 250 || array.length == 500)
  end

  def test_multibyte
    assert @tester.multibyte.is_a? String
    assert %w[😀 ❤ 😡].include?(@tester.multibyte)
  end

  def test_paragraph_char_count
    paragraph = @tester.paragraph_by_chars(number: 256)
    assert(paragraph.length == 256)
  end

  def test_unique_with_already_set_values
    values = ('a'..'z').to_a + ('0'..'9').to_a
    @tester.unique.exclude(:character, [], values)
    assert_raise(Faker::UniqueGenerator::RetryLimitExceeded) { @tester.unique.character }
  end

  def test_unique_with_already_set_values_and_parameter
    values = ('a'..'z').to_a + ('0'..'9').to_a
    @tester.unique.exclude(:characters, [number: 1], values)
    assert_raise(Faker::UniqueGenerator::RetryLimitExceeded) { @tester.unique.characters(number: 1) }
  end
end
