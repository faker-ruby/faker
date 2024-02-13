# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsSiliconValley < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::SiliconValley
  end

  def test_characters
    assert_match(/\w+/, @tester.character)
  end

  def test_companies
    assert_match(/\w+/, @tester.company)
  end

  def test_quotes
    assert_match(/\w+/, @tester.quote)
  end

  def test_apps
    assert_match(/\w+/, @tester.app)
  end

  def test_inventions
    assert_match(/\w+/, @tester.invention)
  end

  def test_mottos
    assert_match(/\w+/, @tester.motto)
  end

  def test_urls
    assert_match(/\w+/, @tester.url)
  end

  def test_email
    assert_match(/\w+/, @tester.email)
  end
end
