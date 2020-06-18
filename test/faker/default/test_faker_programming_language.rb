# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerProgrammingLanguage < Test::Unit::TestCase
  def setup
    @tester = Faker::ProgrammingLanguage
  end

  def test_name
    assert @tester.name.match?(/\w/)
  end

  def test_creator
    assert @tester.creator.match?(/\w/)
  end
end
