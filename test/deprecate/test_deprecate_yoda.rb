# frozen_string_literal: true

require_relative '../test_helper'

class TestDeprecateYoda < Test::Unit::TestCase
  def setup
    @tester = Faker::Yoda
  end

  def test_fact
    assert @tester.quote.match(/\w+/)
  end
end
