# frozen_string_literal: true

class TestFakerTvShowsSmallville < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Smallville
    Faker::Config.locale = nil
  end

  def test_characters
    10.times { assert @tester.character.match(/[\w]+/) }
  end

  def test_main_characters
    10.times { assert @tester.main_character.match(/[\w]+/) }
  end

  def test_locations
    10.times { assert @tester.location.match(/[\w]+/) }
  end

  def test_quotes
    10.times { assert @tester.quote.match(/[\w]+/) }
  end

  def test_songs
    10.times { assert @tester.song.match(/[\w]+/) }
  end

  def test_lex_license_plates
    10.times { assert @tester.lex_license_plate.match(/[\w]+/) }
  end
end
