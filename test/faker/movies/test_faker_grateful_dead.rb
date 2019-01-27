# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMoviesGratefulDead < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::GratefulDead
  end

  def test_player
    assert @tester.player.match(/\w/)
  end

  def test_song
    assert @tester.song.match(/\w/)
  end
end
