# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerProgrammingLanguage < Test::Unit::TestCase
  def setup
    @tester = Faker::ProgrammingLanguage
  end

  def test_name
    assert_match @tester.name, /\w/
  end

  def test_creator
    assert_match @tester.creator, /\w/
  end
end
