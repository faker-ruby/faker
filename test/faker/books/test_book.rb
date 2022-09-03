# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBook < Test::Unit::TestCase
  def setup
    @tester = Faker::Book
  end

  def test_title
    assert_match @tester.title, /(\w+\.? ?){2,3}/
  end

  def test_author
    assert_match @tester.author, /(\w+\.? ?){2,3}/
  end

  def test_publisher
    assert_match @tester.publisher, /(\w+\.? ?){2,3}/
  end

  def test_genre
    assert_match @tester.genre, /(\w+\.? ?){2,3}/
  end
end
