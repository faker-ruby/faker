# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGame < Test::Unit::TestCase
  def setup
    @tester = Faker::Game
  end

  def test_title
    assert @tester.title.match?(/\w+/)
  end

  def test_genre
    assert @tester.genre.match?(/\w+/)
  end

  def test_platform
    assert @tester.platform.match?(/\w+/)
  end
end
