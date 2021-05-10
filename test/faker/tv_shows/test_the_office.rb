# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsTheOffice < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::TheOffice
  end

  def test_characters
    assert @tester.character.match(/\w+/)
  end

  def test_quotes
    assert @tester.quote.match(/\w+/)
  end
end
