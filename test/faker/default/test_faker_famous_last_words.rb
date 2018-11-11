# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerFamousLastWords < Test::Unit::TestCase
  def setup
    @tester = Faker::FamousLastWords
  end

  def test_name
    assert @tester.last_words.match(/\w+/)
  end
end
