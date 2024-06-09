# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBaseball < Test::Unit::TestCase
  def setup
    @tester = Faker::Sports::Baseball
  end

  def test_league
    assert_match(/\w+/, @tester.league)
  end

  def test_team
    assert_match(/\w+/, @tester.team)
  end

  def test_player
    assert_match(/\w+/, @tester.player)
  end

  def test_position
    assert_match(/\w+/, @tester.position)
  end
end
