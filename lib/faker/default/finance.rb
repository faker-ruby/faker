# frozen_string_literal: true

module Faker
  class Finance < Base
    CREDIT_CARD_TYPES = %i[visa mastercard discover american_express
                           diners_club jcb switch solo dankort
                           maestro forbrugsforeningen laser].freeze

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

      def vat_number(legacy_country = NOT_GIVEN, country: 'BR')
        if legacy_country != NOT_GIVEN
          warn_with_uplevel 'Passing `country` with the 1st argument of `Finance.vat_number` is deprecated. Use keyword argument like `Finance.vat_number(country: ...)` instead.', uplevel: 1
          country = legacy_country
        end

        # Some contries have specific rules regarding vat number generation
        # e.g. some control/checksum digit (Portugal, Poland, etc.)
        # those cases are handled using a method implemented below with the following format
        meth = "#{country.downcase}_vat_number"
        # if we find any of those methods we call it,
        # otherwise we just fill the template retrieved from the locale file
        if Faker::Finance.respond_to?(meth, true)
          Faker::Finance.send(meth)
        else
          numerify(fetch("finance.vat_number.#{country}"))
        end
      rescue I18n::MissingTranslationData
        raise ArgumentError, "Could not find vat number for #{country}"
      end

      def vat_number_keys
        translate('faker.finance.vat_number').keys
      end

      private

      # ref: #see: http://pt.wikipedia.org/wiki/N%C3%BAmero_de_identifica%C3%A7%C3%A3o_fiscal
      def pt_vat_number
        base_number = "#{Faker::Number.between(from: 1, to: 2)}#{Faker::Number.leading_zero_number(digits: 7)}"
        control_number = pt_vat_number_checksum_digit(base_number)
        "#{base_number}#{control_number}"
      end

      def pt_vat_number_checksum_digit(number)
        multiplier = 1
        result = String(number).delete(' ').split('').map(&:to_i).reverse.map do |digit|
          digit * (multiplier += 1)
        end.reduce(:+) || 0

        # cover for the digit collision flaw
        return 0 if (control_number = 11 - result % 11) > 9

        control_number
      end
    end
  end
end
