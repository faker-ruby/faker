# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsTheItCrowd < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::TheITCrowd
  end

  def test_actors
    assert_match(/\w+/, @tester.actor)
  end

  def test_characters
    assert_match(/\w+/, @tester.character)
  end

  def test_emails
    assert_match(/\w+/, @tester.email)
  end

  def test_quotes
    assert_match(/\w+/, @tester.quote)
  end
end
