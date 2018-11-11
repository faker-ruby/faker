# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAlphanum < Test::Unit::TestCase
  def setup
    @tester = Faker::Alphanumeric
  end

  def alpha
    assert @tester.alpha(5).match(/[a-z]{5}/)
  end

  def alphanum
    assert @tester.alphanumeric(5).match(/[a-z0-9]{5}/)
  end
end
