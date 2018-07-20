# frozen_string_literal: true

equire_relative 'test_helper'

def setup
  @tester = Faker::GratefulDead
end

def test_player
  assert @tester.player.match(/\w/)
end

def test_song
  assert @tester.song.match(/\w/)
end
