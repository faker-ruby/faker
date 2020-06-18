# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerPRince < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::Prince
  end

  def test_song
    assert @tester.song.match?(/\w+/)
  end

  def test_lyric
    assert @tester.lyric.match?(/\w+/)
  end

  def test_album
    assert @tester.album.match?(/\w+/)
  end

  def test_band
    assert @tester.band.match?(/\w+/)
  end
end
