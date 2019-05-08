# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGame < Test::Unit::TestCase
  def setup
    @tester = Faker::Game
  end

  def test_title
    assert @tester.title.match(/(\w+\.? ?){2,3}/)
  end

  def test_genre
    assert @tester.genre.match(/(\w+\.? ?){2,3}/)
  end
end
