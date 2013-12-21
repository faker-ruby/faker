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
    assert @tester.author.match(/(\w+\.? ?){2,3}/)
  end

  def test_isbn
    assert @tester.isbn.match(isbn_ten_regexp)
  end

  def test_isbn_ten
    assert @tester.isbn_ten.match(isbn_ten_regexp)
  end

  def test_asin
    assert @tester.asin.match(isbn_ten_regexp)
  end

  private

  def isbn_ten_regexp
    /[0-9]{9}([0-9]|X|x)/
  end
end
