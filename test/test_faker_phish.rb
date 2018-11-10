# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerPhish < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::Phish
  end

  def test_song
    assert @tester.song.match(/\w+/)
  end
end
