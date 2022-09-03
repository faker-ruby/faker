# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsTheItCrowd < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::TheITCrowd
  end

  def test_actors
    assert_match @tester.actor, /\w+/
  end

  def test_characters
    assert_match @tester.character, /\w+/
  end

  def test_emails
    assert_match @tester.email, /\w+/
  end

  def test_quotes
    assert_match @tester.quote, /\w+/
  end
end
