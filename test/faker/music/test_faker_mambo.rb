# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMambo < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::Mambo
  end

  def test_name
    assert @tester.name.match(/\w/)
  end
end
