# frozen_string_literal: true

require_relative '../../test_helper'

class TestDeprecateRobin < Test::Unit::TestCase
  def setup
    @tester = Faker::Robin
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
