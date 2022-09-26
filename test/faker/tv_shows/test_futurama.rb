# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsFuturama < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Futurama
  end

  def test_characters
    10.times { assert_match(/\w+/, @tester.character) }
  end

  def test_locations
    10.times { assert_match(/\w+/, @tester.location) }
  end

  def test_quote
    10.times { assert_match(/\w+/, @tester.quote) }
  end

  def test_hermes_catchphrases
    10.times { assert_match(/\w+/, @tester.hermes_catchphrase) }
  end
end
