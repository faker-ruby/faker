require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerImage < Test::Unit::TestCase
  def setup
    @tester = Faker::Image
  end

  def test_urls
    Google::Search::Image.stub :initialize, Google::Search::Image do
      assert @tester.urls('test',1).is_a?(Array)
    end
  end

end
