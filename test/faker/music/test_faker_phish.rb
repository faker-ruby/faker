# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerPhish < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::Phish
  end

  def test_album
    assert_match @tester.album, /\w+/
  end

  def test_musician
    assert_match @tester.musician, /\w+/
  end

  def test_song
    assert_match @tester.song, /\w+/
  end
end
