require File.dirname(__FILE__) + '/test_helper.rb'

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

  def test_characters_with_args
    100.times { assert @tester.characters(500).length == 500 }
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

  # Faker::Lorem.word generates random word from standart wordlist
  def test_word
    @tester = Faker::Lorem
    @standard_wordlist = I18n.translate('faker.lorem.words')
    100.times { assert @standard_wordlist.include?(@tester.word) }
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

  def test_array_count_param
    cs = @tester.characters([1,4])
    ws = @tester.words([1,4])
    ss = @tester.sentences([1,4])
    ps = @tester.paragraphs([1,4])

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
    assert(250 <= range.length && range.length <= 500)
    assert(array.length == 250 || array.length == 500)
  end
end
