require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerUmphreysMcgee < Test::Unit::TestCase

  def setup
    @tester = Faker::UmphreysMcgee
  end

  def test_song
    assert @tester.song.match(/\w+/)
  end
end
