# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShow < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShow
  end

  def title
    assert_match(/\w+/, @tester.title)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end
end
