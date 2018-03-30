require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerBook < Test::Unit::TestCase

  def setup
    @tester = Faker::Book
  end

  def test_title
    assert @tester.title.match(/(\w+\.? ?){2,3}/)
  end

  def test_author
    assert @tester.author.match(/(\w+\.? ?){2,3}/)
  end

  def test_publisher
    assert @tester.publisher.match(/(\w+\.? ?){2,3}/)
  end

  def test_genre
    assert @tester.genre.match(/(\w+\.? ?){2,3}/)
  end
end
