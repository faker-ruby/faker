# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGame < Test::Unit::TestCase
  def setup
    @tester = Faker::Game
  end

  def test_title
    assert_match @tester.title, /\w+/
  end

  def test_genre
    assert_match @tester.genre, /\w+/
  end

  def test_platform
    assert_match @tester.platform, /\w+/
  end
end
