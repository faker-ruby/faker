# frozen_string_literal: true

require_relative '../../test_helper'

require 'cli'

describe Faker::CLI::Reflectors::Search do
  before do
    @reflector = Faker::CLI::Reflectors::Search
  end

  describe '#call' do
    describe 'when a match is found' do
      it 'it returns the list of matches' do
        query = 'firstname'

        reflector = @reflector.new(query)
        result = reflector.call

        assert_includes(result[Faker::Name], :first_name)
        assert_kind_of(Hash, result)
      end
    end

    describe 'when no match is found' do
      it 'returns an empty hash' do
        query = 'foobar'

        reflector = @reflector.new(query)
        result = reflector.call

        assert_empty(result)
        assert_kind_of(Hash, result)
      end
    end
  end
end
