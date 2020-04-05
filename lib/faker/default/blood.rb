# frozen_string_literal: true

module Faker
  class Blood < Base
    flexible :blood

    class << self
      ##
      # Produces a random blood group name.
      #
      # @return [String]
      #
      # @example
      #   Faker::Blood.group #=> "AB-"
      #
      # @faker.version next
      def group
        fetch('blood.group')
      end
    end
  end
end
