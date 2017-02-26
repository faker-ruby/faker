require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerMarkdown < Test::Unit::TestCase
  def setup
    @tester = Faker::Markdown
  end

  def test_headers
    assert @tester.headers.match(/\W \w+/)
  end

  def test_emphasis
    assert @tester.emphasis.match(/\W \w+/)
  end

end
