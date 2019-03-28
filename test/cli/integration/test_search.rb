# frozen_string_literal: true

require_relative '../../test_helper'

require 'cli'

describe '`faker search` command' do
  it 'executes `faker help search` command successfully' do
    output = `faker help search`
    expected_output = <<~OUT
      Usage:
        faker search [Faker]

      Options:
        -h, [--help], [--no-help]                  # Display usage information
        -m, [--show-methods], [--no-show-methods]  # Display Faker constants with methods
                                                   # Default: true
        -v, [--verbose], [--no-verbose]            # Include sample Faker output

      Search Faker method(s)
    OUT

    assert_match(expected_output, output)
  end

  describe 'when search query exists' do
    it 'returns results' do
      output = `faker search name`

      assert_match(/Faker::/, output)
      assert_match(/└──/, output)
    end
  end

  describe 'when search query does not exist' do
    it 'returns a not found message' do
      output = `faker search foobar`

      assert_match(/Sorry, we couldn't find a match/, output)
    end
  end
end
