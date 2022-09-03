# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMichaelScott < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::MichaelScott
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end
end
