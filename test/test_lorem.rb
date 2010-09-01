
require File.dirname(__FILE__) + '/test_helper.rb'

class TestFakerLorem < Test::Unit::TestCase

  def setup
    @tester = Faker::Lorem
  end

  def test_words
    assert @tester.words(3).size == 3
  end

  def test_sentence
    assert @tester.sentence(3).split(' ').size > 3
  end

  def test_sentences
    assert @tester.sentences(3).size == 3
  end


  def test_paragraph
    assert @tester.paragraph(3).is_a?(String)
  end


  def test_paragraphs
    assert @tester.paragraphs(3).size == 3
  end
  
  def test_argument_as_range
    1.upto(4) do
      assert @tester.words(3..5).size >= 3
      assert @tester.words(3..5).size <= 5
    end
  end
end
