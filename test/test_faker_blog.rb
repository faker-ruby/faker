require File.dirname(__FILE__) + '/test_helper.rb'

class TestFakerBlog < Test::Unit::TestCase

  def setup
    @tester = Faker::Blog
  end

  def test_title
    assert @tester.title.length > 1
  end

  def test_title_type
    assert @tester.title.class == String
  end

  def test_body
    assert @tester.title.length > 10
  end

  def test_body_type
    assert @tester.title.class == String
  end

  def test_author_type
    assert @tester.author.class == Hash
  end

  def test_post_type
    assert @tester.post.class == Hash
  end

  def test_comment_type
    assert @tester.comment.class == Hash
  end

  def test_post_params
    assert @tester.post({name: "author"})[:author][:name].class == String
  end

  def test_comment_params
    assert @tester.comment({title: "title"})[:post][:title].class == String
  end
end
