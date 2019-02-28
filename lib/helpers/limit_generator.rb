# frozen_string_literal: true

module Faker
    class LimitGenerator
      def initialize(generator, max, min, max_retries)
        @generator = generator
        @max = max
        @min = min
        @max_retries = max_retries
        @previous_results = Hash.new { |hash, key| hash[key] = Set.new }
      end
  
      # rubocop:disable Style/MethodMissingSuper
      def method_missing(name, *arguments)
        self.class.marked_unique.add(self)
  
        @max_retries.times do
          result = @generator.public_send(name, *arguments)
  
          next if result.length < @min || result.length > @max

          return result
        end
  
        raise RetryLimitExceeded, "Retry limit exceeded for #{name}"
      end
      # rubocop:enable Style/MethodMissingSuper
  
      def respond_to_missing?(method_name, include_private = false)
        method_name.to_s.start_with?('faker_') || super
      end
  
      RetryLimitExceeded = Class.new(StandardError)
    end
  end
  