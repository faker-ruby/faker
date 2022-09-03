# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerRockBand < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::RockBand
  end

  def test_name
    assert_match @tester.name, /\w+/
  end

  def test_song
    assert_match @tester.song, /\w+/
  end
end
