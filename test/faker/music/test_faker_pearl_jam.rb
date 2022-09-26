# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerPearlJam < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::PearlJam
  end

  def test_musician
    assert_match(/\w/, @tester.musician)
  end

  def test_album
    assert_match(/\w/, @tester.album)
  end

  def test_song
    assert_match(/\w/, @tester.song)
  end
end
