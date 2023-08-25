# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsFuturama < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::Futurama
  end

  def test_characters
    deterministically_verify(-> { @tester.character }, depth: 5) { |result| assert_match(/\w+/, result) }
  end

  def test_locations
    deterministically_verify(-> { @tester.location }, depth: 5) { |result| assert_match(/\w+/, result) }
  end

  def test_quote
    deterministically_verify(-> { @tester.quote }, depth: 5) { |result| assert_match(/\w+/, result) }
  end

  def test_hermes_catchphrases
    deterministically_verify(-> { @tester.hermes_catchphrase }, depth: 5) { |result| assert_match(/\w+/, result) }
  end
end
