# frozen_string_literal: true

module Faker
  class SouthAfrica < Base
    class << self
      def id_number
        Faker::IDNumber.south_african_id_number
      end

      def valid_id_number
        Faker::IDNumber.valid_south_african_id_number
      end

      def invalid_id_number
        Faker::IDNumber.invalid_south_african_id_number
      end

      def phone_number
        with_locale 'en-ZA' do
          Faker::PhoneNumber.phone_number
        end
      end

      def cell_phone
        with_locale 'en-ZA' do
          Faker::PhoneNumber.cell_phone
        end
      end
    end
  end
end
