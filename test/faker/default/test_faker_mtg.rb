# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMtg < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Mtg
  end

  def test_inheritance
    assert @tester < Faker::Games::MagicTheGathering
  end
end
