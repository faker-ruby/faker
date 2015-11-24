require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerVideo < Test::Unit::TestCase
  def setup
    @tester = Faker::Video
  end

  def test_urls
    assert @tester.urls('test',1).is_a?(Array)
  end

end
