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

      def pty_ltd_registration_number
        Faker::Company.south_african_pty_ltd_registration_number
      end

      def close_corporation_registration_number
        Faker::Company.south_african_close_corporation_registration_number
      end

      def listed_company_registration_number
        Faker::Company.south_african_listed_company_registration_number
      end

      def trust_registration_number
        Faker::Company.south_african_trust_registration_number
      end

      def vat_number
        Faker::Finance.vat_number('ZA')
      end
    end
  end
end
