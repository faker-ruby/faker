# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerUmphreysMcgee < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::UmphreysMcgee
  end

  def test_song
    assert_match(/\w+/, @tester.song)
  end
end
