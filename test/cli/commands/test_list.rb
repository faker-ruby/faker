# frozen_string_literal: true

require_relative '../../test_helper'

require 'cli'

describe Faker::CLI::Commands::List do
  before do
    @list = Faker::CLI::Commands::List
  end

  describe 'when single `list` command' do
    it 'executes successfully' do
      output = StringIO.new
      options = {}

      command = @list.new(options)
      command.execute(output: output)

      assert_match(/Faker/, output.string)
      assert_equal(true, output.string.lines.size.positive?)
    end
  end

  describe 'when `list -v` verbose command' do
    it 'executes successfully' do
      output = StringIO.new
      options = { verbose: true }

      command = @list.new(options)
      command.execute(output: output)
      constant = output.string.lines[0]

      assert_match(/Faker::/, constant)
    end
  end
end
