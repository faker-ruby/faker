# frozen_string_literal: true

require_relative '../../test_helper'

require 'cli'

describe Faker::CLI::Commands::Search do
  before do
    @search = Faker::CLI::Commands::Search
  end

  describe 'when query object exists' do
    it 'returns results' do
      output = StringIO.new
      options = {}

      command = @search.new(options)
      command.execute('image', output: output)

      assert_match(/Faker/, output.string)
      assert_equal(true, output.string.lines.size.positive?)
    end
  end

  describe 'when query object does not exist' do
    it 'returns a not found message' do
      output = StringIO.new
      options = {}

      command = @search.new(options)
      command.execute('foobar', output: output)

      assert_match(/Sorry, we couldn't find a match/, output.string)
    end
  end
end
