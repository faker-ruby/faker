# frozen_string_literal: true

module Faker
  module Filtering
    MAX_RETRIES = 10_000

    def select(max_retries = MAX_RETRIES)
      Filter.new(self, max_retries) { |result| yield result }
    end

    def reject(max_retries = MAX_RETRIES)
      select(max_retries) { |result| !yield(result) }
    end
  end
end
