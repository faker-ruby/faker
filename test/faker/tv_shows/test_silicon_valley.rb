# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsSiliconValley < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::SiliconValley
  end

  def test_characters
    assert_match @tester.character, /\w+/
  end

  def test_companies
    assert_match @tester.company, /\w+/
  end

  def test_quotes
    assert_match @tester.quote, /\w+/
  end

  def test_apps
    assert_match @tester.app, /\w+/
  end

  def test_inventions
    assert_match @tester.invention, /\w+/
  end

  def test_mottos
    assert_match @tester.motto, /\w+/
  end

  def test_urls
    assert_match @tester.url, /\w+/
  end

  def test_email
    assert_match @tester.email, /\w+/
  end
end
