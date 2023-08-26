# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerChess < Test::Unit::TestCase
  def setup
    @tester = Faker::Sports::Chess
  end

  def test_player
    assert_match(/\w+/, @tester.player)
  end

  def test_federation
    assert_match(/\w+/, @tester.federation)
  end

  def test_tournament
    assert_match(/\w+/, @tester.tournament)
  end

  def test_rating
    deterministically_verify -> { @tester.rating(from: 2000, to: 2900) }, depth: 5 do |random_number|
      assert random_number >= 2000, "Expected >= 2000, but got #{random_number}"
      assert random_number <= 2900, "Expected <= 2900, but got #{random_number}"
    end
  end

  def test_opening
    assert_match(/\w+/, @tester.opening)
  end

  def test_title
    assert_match(/\w+/, @tester.title)
  end
end
