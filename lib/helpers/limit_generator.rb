# frozen_string_literal: true

module Faker
  class LimitGenerator
    def initialize(generator, min, max, max_retries)
      @generator = generator
      @min = min
      @max = max
      @max_retries = max_retries
    end

    # rubocop:disable Style/MethodMissingSuper
    def method_missing(name, *arguments)
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
