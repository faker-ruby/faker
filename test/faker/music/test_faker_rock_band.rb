# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerRockBand < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::RockBand
  end

  def test_name
    assert @tester.name.match(/\w+/)
  end

  def test_song
    assert @tester.song.match(/\w+/)
  end
end
