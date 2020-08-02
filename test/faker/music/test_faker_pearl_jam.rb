# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerPearlJam < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::PearlJam
  end

  def test_musician
    assert @tester.musician.match(/\w/)
  end

  def test_album
    assert @tester.album.match(/\w/)
  end

  def test_song
    assert @tester.song.match(/\w/)
  end
end
