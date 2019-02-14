# frozen_string_literal: true

require_relative '../../test_helper'

class TestDeprecateMostInterestingManInTheWorld < Test::Unit::TestCase
  def setup
    @tester = Faker::MostInterestingManInTheWorld
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
