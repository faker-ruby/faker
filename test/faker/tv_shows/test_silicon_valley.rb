# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsSiliconValley < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::SiliconValley
  end

  def test_characters
    assert @tester.character.match(/\w+/)
  end

  def test_companies
    assert @tester.company.match(/\w+/)
  end

  def test_quotes
    assert @tester.quote.match(/\w+/)
  end

  def test_apps
    assert @tester.app.match(/\w+/)
  end

  def test_inventions
    assert @tester.invention.match(/\w+/)
  end

  def test_mottos
    assert @tester.motto.match(/\w+/)
  end

  def test_urls
    assert @tester.url.match(/\w+/)
  end

  def test_email
    assert @tester.email.match(/\w+/)
  end
end
