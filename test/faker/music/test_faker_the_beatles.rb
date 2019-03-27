# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTheBeatles < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::TheBeatles
  end

  def test_member
    assert @tester.member.match(/\w+/)
  end

  def test_album
    assert @tester.album.match(/\w+/)
  end

  def test_song
    assert @tester.song.match(/\w+/)
  end
end
