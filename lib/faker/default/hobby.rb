# frozen_string_literal: true

module Faker
  class Hobby < Base
    flexible :hobby

    class << self
      ##
      # Retrieves a typical hobby activity.
      #
      # @return [String]
      #
      # @example
      #   Faker::Hobby.activity #=> "Cooking"
      #
      # @faker.version 2.18.0
      def activity
        fetch('hobby.activity')
      end
    end
  end
end
