# frozen_string_literal: true

require_relative '../../test_helper'

require 'cli'

describe '`faker list` command' do
  it 'executes `faker help list` command successfully' do
    output = `faker help list`
    expected_output = <<~OUT
      Usage:
        faker list

      Options:
        -h, [--help], [--no-help]                  # Display usage information
        -m, [--show-methods], [--no-show-methods]  # Display Faker constants with methods
                                                   # Default: true
        -v, [--verbose], [--no-verbose]            # Include sample Faker output

      List all Faker constants
    OUT

    assert_match(expected_output, output)
  end

  it 'executes `faker list` command successfully' do
    output = `faker list`

    assert_match(/Faker::/, output)
  end

  it 'executes `faker list -v` command successfully' do
    output = `faker list -v`

    assert_match(/Faker::/, output)
  end
end
