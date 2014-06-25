require File.dirname(__FILE__) + '/test_helper.rb'

class TestFakerCode < Test::Unit::TestCase
  def setup
    @tester = Faker::Code
  end

  def test_default_isbn_regexp
    assert @tester.isbn.match(/^\d{9}-[\d|X]$/)
  end

  def test_default_isbn13_regexp
    assert @tester.isbn(13).match(/^\d{12}-\d$/)
  end

  def test_default_ean_regexp
    assert @tester.ean.match(/^\d{13}$/)
  end

  def test_default_ean8_regexp
    assert @tester.ean(8).match(/^\d{8}$/)
  end
end
