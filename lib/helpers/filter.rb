# frozen_string_literal: true

require_relative 'filtering'

module Faker
  class Filter
    include Filtering

    def initialize(generator, max_retries, &filter)
      @generator = generator
      @max_retries = max_retries
      @filter = filter
    end

    def method_missing(name, *arguments)
      return super unless respond_to_missing? name

      @max_retries.times do
        result = @generator.public_send(name, *arguments)

        next unless @filter.call(result)

        return result
      end

      raise RetryLimitExceeded, "Retry limit exceeded for #{name}"
    end

    def respond_to_missing?(method_name, include_private = false)
      @generator.respond_to?(method_name) || super
    end

    RetryLimitExceeded = Class.new(StandardError)
  end
end
