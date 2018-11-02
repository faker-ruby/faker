# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerMarketingBuzzwords < Test::Unit::TestCase
  def setup
    @tester = Faker::MarketingBuzzwords
  end

  def test_name
    assert @tester.buzzwords.match(/\w+/)
  end
end
