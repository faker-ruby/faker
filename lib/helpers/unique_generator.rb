module Faker
  class UniqueGenerator
    RetryLimitExceeded = Class.new(StandardError)

    def initialize(generator, max_retries)
      @generator = generator
      @max_retries = max_retries
      @previous_results = Hash.new { |hash, key| hash[key] = Set.new }
    end

    def method_missing(name, *arguments)
      if @generator.respond_to?(name)
        retry_and_add_results_to_hash(name, *arguments)
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      method_name.to_s.start_with?('faker_') || super
    end

    def clear
      @previous_results.clear
    end

    def self.clear
      ObjectSpace.each_object(self, &:clear)
    end

    private

    def retry_and_add_results_to_hash(name, *arguments)
      @max_retries.times do
        result = @generator.public_send(name, *arguments)

        next if @previous_results[[name, arguments]].include?(result)

        @previous_results[[name, arguments]] << result
        return result
      end
      raise RetryLimitExceeded, "Retry limit exceeded for #{name}"
    end
  end
end
