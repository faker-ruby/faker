# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGratefulDead < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::GratefulDead
  end

  def test_player
    assert_match @tester.player, /\w/
  end

  def test_song
    assert_match @tester.song, /\w/
  end
end
