# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMichaelScott < Test::Unit::TestCase
  def setup
    @tester = Faker::MichaelScott
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
