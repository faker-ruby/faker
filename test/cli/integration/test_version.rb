# frozen_string_literal: true

require_relative '../../test_helper'

require 'cli'

describe '`faker version` command' do
  it 'executes `faker version` command successfully' do
    output = `faker version`
    expected_output = 'v1.9.3'

    assert_match(expected_output, output)
  end
end
