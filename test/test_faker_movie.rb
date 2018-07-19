# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerMovie < Test::Unit::TestCase
  def setup
    @tester = Faker::Movie
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
