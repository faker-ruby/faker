# frozen_string_literal: true

module Faker
  class ExceptGenerator
    def initialize(generator, values, max_retries)
      @generator = generator
      @excluded_values = Array(values)
      @max_retries = max_retries
    end

    def method_missing(name, *arguments)
      @max_retries.times do
        result = @generator.public_send(name, *arguments)

        return result unless @excluded_values.include?(result)
      end

      raise RetryLimitExceeded, "Retry limit exceeded for #{name} (excluded values: #{@excluded_values.inspect})"
    end
    # Have method_missing use ruby 2.x keywords if the method exists.
    # This is necessary because the syntax for passing arguments (`...`)
    # is invalid on versions before Ruby 2.7, so it can't be used.
    ruby2_keywords(:method_missing) if respond_to?(:ruby2_keywords, true)

    def respond_to_missing?(method_name, include_private = false)
      @generator.respond_to?(method_name, include_private) || super
    end

    RetryLimitExceeded = Class.new(StandardError)
  end
end
