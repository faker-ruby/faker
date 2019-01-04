# frozen_string_literal: true

require_relative '../test_helper'

require 'cli'

describe Faker::CLI::Reflector do
  before do
    @reflector = Faker::CLI::Reflector
  end

  describe '.find' do
    describe 'when a match is found' do
      it 'it returns the list of matches' do
        result = @reflector.find('firstname')

        assert_kind_of Hash, result
        assert_includes result[Faker::Name], :first_name
      end
    end

    describe 'when no match is found' do
      it 'returns an empty array' do
        result = @reflector.find('foobar')

        assert_empty result
      end
    end
  end
end
