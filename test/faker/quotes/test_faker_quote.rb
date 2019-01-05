# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerYoda < Test::Unit::TestCase
  def setup
    @tester = Faker::Quote
  end

  def test_quote
    assert @tester.yoda.match(/\w+/)
  end
end
