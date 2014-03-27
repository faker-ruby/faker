require 'date'
require 'iso/iban'

module Faker
  class Business < Base
    flexible :business

    class << self
      def credit_card_number
        fetch('business.credit_card_numbers')
      end

      def credit_card_expiry_date
        Date.parse(fetch('business.credit_card_expiry_dates'))
      end

      def credit_card_type
        fetch('business.credit_card_types')
      end

      def iban(iso_country_code = nil)
        iban = iso_country_code ? ISO::IBAN.random(iso_country_code) : ISO::IBAN.random
        iban.compact
      end
    end

  end
end
