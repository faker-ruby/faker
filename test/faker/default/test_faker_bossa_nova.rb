# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBossaNova < Test::Unit::TestCase
  def setup
    @tester = Faker::BossaNova
  end

  def test_artists
    assert_match(/\w+/, @tester.artist)
  end

  def test_songs
    assert_match(/\w+/, @tester.song)
  end
end
