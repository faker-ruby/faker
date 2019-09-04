# frozen_string_literal: true

module Faker
  class Boolean < Base
    class << self
      def boolean(legacy_true_ratio = NOT_GIVEN, true_ratio: 0.5)
        warn_for_deprecated_arguments do |keywords|
          keywords << :true_ratio if legacy_true_ratio != NOT_GIVEN
        end

        (rand < true_ratio)
      end
    end
  end
end
