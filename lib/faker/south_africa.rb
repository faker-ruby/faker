# frozen_string_literal: true

module Faker
  class SouthAfrica < Base
    class << self
      def valid_id_number
        Faker::IDNumber.valid_south_african_id_number
      end

      def invalid_id_number
        Faker::IDNumber.invalid_south_african_id_number
      end
    end
  end
end
