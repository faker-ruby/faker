module Faker
  class UniqueGenerator
    def initialize(generator, max_retries)
      @generator = generator
      @max_retries = max_retries
      @previous_results = Hash.new { |hash, key| hash[key] = Set.new }
    end

    def method_missing(name, *arguments)
      @max_retries.times do
        result = @generator.public_send(name, *arguments)

        next if @previous_results[[name, arguments]].include?(result)

        @previous_results[[name, arguments]] << result
        return result
      end

      raise RetryLimitExceeded
    end

    RetryLimitExceeded = Class.new(StandardError)

    def clear
      @previous_results.clear
    end

    def self.clear
      ObjectSpace.each_object(self, &:clear)
    end
  end
end
