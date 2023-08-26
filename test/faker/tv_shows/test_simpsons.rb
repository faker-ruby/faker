# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsSimpsons < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Simpsons
    Faker::Config.locale = nil
  end

  def test_characters
    deterministically_verify(-> { @tester.character }) { |result| assert_match(/\w+/, result) }
  end

  def test_locations
    deterministically_verify(-> { @tester.location }) { |result| assert_match(/\w+/, result) }
  end

  def test_quote
    deterministically_verify(-> { @tester.quote }) { |result| assert_match(/\w+/, result) }
  end

  def test_episode_titles
    deterministically_verify(-> { @tester.episode_title }) { |result| assert_match(/\w+/, result) }
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
