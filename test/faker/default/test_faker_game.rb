# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGame < Test::Unit::TestCase
  def setup
    @tester = Faker::Game
  end

  def test_title
    assert_match(/\w+/, @tester.title)
  end

  def test_genre
    assert_match(/\w+/, @tester.genre)
  end

  def test_platform
    assert_match(/\w+/, @tester.platform)
  end
end
