# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerPRince < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::Prince
  end

  def test_song
    assert_match(/\w+/, @tester.song)
  end

  def test_lyric
    assert_match(/\w+/, @tester.lyric)
  end

  def test_album
    assert_match(/\w+/, @tester.album)
  end

  def test_band
    assert_match(/\w+/, @tester.band)
  end
end
