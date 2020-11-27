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

    # rubocop:disable Lint/MissingSuper
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
    # rubocop:enable Lint/MissingSuper

    # Have method_missing use ruby 2.x keywords if the method exists.
    # This is necessary because the syntax for passing arguments (`...`)
    # is invalid on versions before Ruby 2.7, so it can't be used.
    ruby2_keywords(:method_missing) if respond_to?(:ruby2_keywords, true)

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
