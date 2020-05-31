# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMovie < Test::Unit::TestCase
  def setup
    @tester = Faker::Movie
  end

  def test_title
    assert @tester.title.match(/\w+/)
  end
end
