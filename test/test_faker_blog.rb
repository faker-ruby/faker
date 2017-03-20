require File.dirname(__FILE__) + '/test_helper.rb'

class TestFakerBlog < Test::Unit::TestCase

  def setup
    @tester = Faker::Blog
  end

  def test_title
    assert @tester.title.length > 1
  end

  def test_title_type
    assert String === @tester.title
  end

  def test_body
    assert @tester.title.length > 10
  end

  def test_body_type
    assert String === @tester.title
  end

  def test_author_type
    assert Hash === @tester.author
  end

  def test_post_type
    assert Hash === @tester.post
  end

  def test_comment_type
    assert Hash === @tester.comment
  end

  def test_post_params
    assert String === @tester.post({name: "author"})[:author][:name]
  end

  def test_comment_params
    assert String === @tester.comment({title: "title"})[:post][:title]
  end
end
