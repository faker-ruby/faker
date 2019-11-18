# frozen_string_literal: true

require_relative 'filtering'

module Faker
  class UniqueGenerator
    include Filtering

    @marked_unique = Set.new # Holds names of generators with unique values

    class << self
      attr_reader :marked_unique
    end

    def initialize(generator, max_retries)
      @generator = generator
      @max_retries = max_retries
      @previous_results = Hash.new { |hash, key| hash[key] = Set.new }
    end

    def method_missing(name, *arguments)
      return super unless respond_to_missing? name

      self.class.marked_unique.add(self)

      @max_retries.times do
        result = @generator.public_send(name, *arguments)

        next if @previous_results[[name, arguments]].include?(result)

        @previous_results[[name, arguments]] << result
        return result
      end

      raise RetryLimitExceeded, "Retry limit exceeded for #{name}"
    end

    def respond_to_missing?(method_name, include_private = false)
      @generator.respond_to?(method_name) || super
    end

    RetryLimitExceeded = Class.new(StandardError)

    def clear
      @previous_results.clear
    end

    def self.clear
      marked_unique.each(&:clear)
      marked_unique.clear
    end

    def exclude(name, arguments, values)
      values ||= []
      values.each do |value|
        @previous_results[[name, arguments]] << value
      end
    end
  end
end
