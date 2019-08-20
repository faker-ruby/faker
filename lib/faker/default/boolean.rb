# frozen_string_literal: true

module Faker
  class Boolean < Base
    class << self
      def boolean(legacy_true_ratio = NOT_GIVEN, true_ratio: 0.5)
        if legacy_true_ratio != NOT_GIVEN
          warn_with_uplevel 'Passing `true_ratio` with the 1st argument of `Boolean.boolean` is deprecated. Use keyword argument like `Boolean.boolean(true_ratio: ...)` instead.', uplevel: 1
          true_ratio = legacy_true_ratio
        end

        (rand < true_ratio)
      end
    end
  end
end
