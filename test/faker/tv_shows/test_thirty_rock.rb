# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsThirtyRock < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::ThirtyRock
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_business_advice
    assert @tester.business_advice.match(/\w+/)
  end

  def test_project
    assert @tester.project.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
