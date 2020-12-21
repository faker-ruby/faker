# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerClash < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::Clash
  end

  def test_punk_rocker
    assert @tester.punk_rocker.match(/\w+/)
  end

  def test_album
    assert @tester.album.match(/\w+/)
  end

  def test_song
    assert @tester.song.match(/\w+/)
  end
end
