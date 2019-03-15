# frozen_string_literal: true

require_relative '../../test_helper'

require 'cli'

describe Faker::CLI::Reflectors::List do
  before do
    @reflector = Faker::CLI::Reflectors::List
  end

  describe '#call' do
    describe 'when show methods is enabled' do
      it 'returns all descendants and their methods' do
        options = { show_methods: true }

        reflector = @reflector.new(options)
        result = reflector.call

        sample_result = result.first
        sample_result_key = sample_result.first.to_s
        sample_result_value = sample_result.last

        assert_kind_of(Hash, result)
        assert_match(/Faker::/, sample_result_key)
        assert_kind_of(Array, sample_result_value)
        refute_empty(sample_result_value)
      end
    end

    describe 'when show methods is disabled' do
      it 'returns only the descendants' do
        options = { show_methods: false }

        reflector = @reflector.new(options)
        result = reflector.call

        sample_result = result.first.to_s

        assert_kind_of(Array, result)
        assert_match(/Faker::/, sample_result)
        refute_empty(result)
      end
    end
  end
end
