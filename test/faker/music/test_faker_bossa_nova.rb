# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBossaNova < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::BossaNova
  end

  def test_artists
    assert_match(/\w+/, @tester.artist)
  end

  def test_songs
    assert_match(/\w+/, @tester.song)
  end

  def test_deprecation
    assert_deprecated do
      Faker::BossaNova.artist
    end

    assert_deprecated do
      Faker::BossaNova.song
    end

    assert_match(/\w+/, Faker::BossaNova.artist)
    assert_match(/\w+/, Faker::BossaNova.song)
  end
end
