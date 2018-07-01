require_relative 'test_helper'

class TestFakerUmphreysMcgee < Test::Unit::TestCase
  def setup
    @tester = Faker::UmphreysMcgee
  end

  def test_song
    assert @tester.song.match(/\w+/)
  end
end
