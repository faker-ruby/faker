# frozen_string_literal: true

module Faker
  class Finance < Base
    CREDIT_CARD_TYPES = %i[visa mastercard discover american_express
                           diners_club jcb switch solo dankort
                           maestro forbrugsforeningen laser].freeze

    VAT_NUMBER_TYPES  = %i[AT BE BG CY CZ DK EE
                           FI FR DE GR HU IE IT
                           LV LT LU MT NL PL PT
                           RO SK SI ES SE GB AL
                           AU BY HR CA NO PH RU
                           SM CH UA AR BR CL EC MX].freeze

    class << self
      def credit_card(*types)
        types = CREDIT_CARD_TYPES if types.empty?
        type = sample(types)
        template = numerify(fetch("finance.credit_card.#{type}"))

        # calculate the luhn checksum digit
        multiplier = 1
        luhn_sum = template.gsub(/[^0-9]/, '').split('').reverse.map(&:to_i).inject(0) do |sum, digit|
          multiplier = (multiplier == 2 ? 1 : 2)
          sum + (digit * multiplier).to_s.split('').map(&:to_i).inject(0) { |digit_sum, cur| digit_sum + cur }
        end

        # the sum plus whatever the last digit is must be a multiple of 10. So, the
        # last digit must be 10 - the last digit of the sum.
        luhn_digit = (10 - (luhn_sum % 10)) % 10

        template.gsub('L', luhn_digit.to_s)
      end

      def vat_number(country = 'BR')
        return '' unless country && VAT_NUMBER_TYPES.include?(country.upcase.to_sym)

        numerify(fetch("finance.vat_number.#{country}"))
      end
    end
  end
end
