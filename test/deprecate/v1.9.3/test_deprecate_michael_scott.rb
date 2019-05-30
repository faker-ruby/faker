# frozen_string_literal: true

require_relative '../../test_helper'

class TestDeprecateMichaelScott < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::MichaelScott
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
