# frozen_string_literal: true

module Faker
  class UniqueGenerator
    @marked_unique = Set.new # Holds names of generators with unique values

    class << self
      attr_reader :marked_unique
    end

    def initialize(generator, max_retries)
      @generator = generator
      @max_retries = max_retries
      @previous_results = Hash.new { |hash, key| hash[key] = Set.new }
    end

    # rubocop:disable Style/MethodMissingSuper
    def method_missing(name, *arguments)
      self.class.marked_unique.add(self)

      @max_retries.times do
        result = @generator.public_send(name, *arguments)

        next if @previous_results[[name, arguments]].include?(result)

        @previous_results[[name, arguments]] << result
        return result
      end

      raise RetryLimitExceeded, "Retry limit exceeded for #{name}"
    end
    # rubocop:enable Style/MethodMissingSuper

    def respond_to_missing?(method_name, include_private = false)
      method_name.to_s.start_with?('faker_') || super
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
