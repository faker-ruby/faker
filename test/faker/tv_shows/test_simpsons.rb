# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsSimpsons < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Simpsons
    Faker::Config.locale = nil
  end

  def test_characters
    10.times { assert_match @tester.character, /\w+/ }
  end

  def test_locations
    10.times { assert_match @tester.location, /\w+/ }
  end

  def test_quote
    10.times { assert_match @tester.quote, /\w+/ }
  end

  def test_episode_titles
    10.times { assert_match @tester.episode_title, /\w+/ }
  end

  def test_locales
    [nil, 'en', 'de'].each do |_locale_name|
      Faker::Config.locale = 'de'
      assert @tester.character.is_a? String
      assert @tester.location.is_a? String
      assert @tester.quote.is_a? String
    end
  end
end
