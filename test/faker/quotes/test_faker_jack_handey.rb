# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJackHandey < Test::Unit::TestCase
  def setup
    @tester = Faker::Quotes::JackHandey
  end

  def test_deep_thoughts_quote
    assert @tester.deep_thoughts.match(/\w+/)
  end
end
