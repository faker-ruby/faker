# frozen_string_literal: true

require_relative '../../test_helper'

class TestDeprecateMatz < Test::Unit::TestCase
  def setup
    @tester = Faker::Matz
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
