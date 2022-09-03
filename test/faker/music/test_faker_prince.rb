# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerPRince < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::Prince
  end

  def test_song
    assert_match @tester.song, /\w+/
  end

  def test_lyric
    assert_match @tester.lyric, /\w+/
  end

  def test_album
    assert_match @tester.album, /\w+/
  end

  def test_band
    assert_match @tester.band, /\w+/
  end
end
