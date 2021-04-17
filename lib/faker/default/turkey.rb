# frozen_string_literal: true

module Faker
  class Turkey < Base
    class << self
      ##
      # Produces a valid Turkey ID number.
      #
      # @return [String]
      #
      # @example
      #   Faker::Turkey.id_number #=> "11111111288"
      #
      # @faker.version 2.18.0
      def valid_id_number
        fetch('turkey.tckn.valid')
      end

      ##
      # Produces an invalid Turkey ID number.
      #
      # @return [String]
      #
      # @example
      #   Faker::Turkey.invalid_id_number #=> "11111111111"
      #
      # @faker.version 2.18.0
      def invalid_id_number
        fetch('turkey.tckn.invalid')
      end

      ##
      # Produces a valid tax number.
      #
      # @return [String]
      #
      # @example
      #   Faker::Turkey.phone_number #=> "1111111114"
      #
      # @faker.version 2.18.0
      def valid_tax_number
        fetch('turkey.tax.valid')
      end

      ##
      # Produces a invalid tax number.
      #
      # @return [String]
      #
      # @example
      #   Faker::Turkey.cell_phone #=> "1111111111"
      #
      # @faker.version 2.18.0
      def invalid_tax_number
        fetch('turkey.tax.invalid')
      end
    end
  end
end
