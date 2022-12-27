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
    assert_equal(1, @tester.character.length)
  end

  def test_character_type
    assert_instance_of String, @tester.character
  end

  def test_characters
    assert_equal(255, @tester.characters.length)
  end

  def test_characters_negatives
    assert_equal '', @tester.characters(number: -1)
    assert_equal '', @tester.characters(number: (-2..-1))
    assert_equal '', @tester.characters(number: [-1, -2])
  end

  def test_characters_with_args
    100.times { assert_equal(500, @tester.characters(number: 500).length) }
  end

  # Words delivered by a standard request should be on the standard wordlist.
  def test_standard_words
    @words = @tester.words(number: 1000)

    @words.each { |w| assert_includes @standard_wordlist, w }
  end

  # Words requested from the supplemental list should all be in that list.
  def test_supplemental_words
    @words = @tester.words(number: 10_000, supplemental: true)

    @words.each { |w| assert_includes @complete_wordlist, w }
  end

  # Faker::Lorem.word generates random word from standard wordlist
  def test_word
    @tester = Faker::Lorem
    @standard_wordlist = I18n.translate('faker.lorem.words')

    100.times { assert_includes @standard_wordlist, @tester.word }
  end

  def test_exact_sentence_word_count
    assert_equal 2, @tester.sentence(word_count: 2, supplemental: false, random_words_to_add: 0).split.length
  end

  def test_exact_count_param
    assert_equal(2, @tester.characters(number: 2).length)
    assert_equal(2, @tester.words(number: 2).length)
    assert_equal(2, @tester.sentences(number: 2).length)
    assert_equal(2, @tester.paragraphs(number: 2).length)
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

    assert_equal(500, exact.length)
    assert(range.length >= 250 && range.length <= 500)
    assert(array.length == 250 || array.length == 500)
  end

  def test_multibyte
    assert @tester.multibyte.is_a? String
    assert_includes %w[😀 ❤ 😡], @tester.multibyte
  end

  def test_paragraph_char_count
    paragraph = @tester.paragraph_by_chars(number: 256)

    assert_equal(256, paragraph.length)
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

  def test_excluded_words_as_string
    excluded_word_string = @tester.word
    @words = @tester.words(number: 10_000, exclude_words: excluded_word_string)

    @words.each { |w| assert_not_equal w, excluded_word_string }
  end

  def test_excluded_words_as_comma_delimited_string
    excluded_words_array = @tester.words(number: 2)
    excluded_words_string = excluded_words_array.join(', ')
    @words = @tester.words(number: 10_000, exclude_words: excluded_words_string)

    @words.each do |w|
      assert_not_equal w, excluded_words_array[0]
      assert_not_equal w, excluded_words_array[1]
    end
  end

  def test_excluded_words_as_array
    excluded_words_array = @tester.words(number: 2)
    @words = @tester.words(number: 10_000, exclude_words: excluded_words_array)

    @words.each do |w|
      assert_not_equal w, excluded_words_array[0]
      assert_not_equal w, excluded_words_array[1]
    end
  end
end
