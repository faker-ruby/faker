# frozen_string_literal: true

module Faker
  class Stripe < Base
    class << self
      extend Gem::Deprecate

      ##
      # Produces a random valid card number.
      #
      # @param card_type [String] Specific valid card type.
      # @return [String]
      #
      # @example
      #   Faker::Stripe.valid_card #=> "4242424242424242"
      #   Faker::Stripe.valid_card(card_type: "visa_debit") #=> "4000056655665556"
      #
      # @deprecated Use the Faker::Business.valid_card_number method instead.
      #
      # @faker.version 1.9.0
      def valid_card(legacy_card_type = NOT_GIVEN, card_type: nil)
        Faker::Business.valid_card_number(legacy_card_type, card_type: card_type)
      end
      deprecate :valid_card, 'Faker::Business.valid_card_number', 2020, 6

      ##
      # Produces a random valid Stripe token.
      #
      # @param card_type [String] Specific valid card type.
      # @return [String]
      #
      # @example
      #   Faker::Stripe.valid_token #=> "tok_visa"
      #   Faker::Stripe.valid_token(card_type: "mc_debit") #=> "tok_mastercard_debit"
      #
      # @faker.version 1.9.0
      def valid_token(legacy_card_type = NOT_GIVEN, card_type: nil)
        warn_for_deprecated_arguments do |keywords|
          keywords << :card_type if legacy_card_type != NOT_GIVEN
        end

        valid_tokens = translate('faker.stripe.valid_tokens').keys

        if card_type.nil?
          card_type = sample(valid_tokens).to_s
        else
          unless valid_tokens.include?(card_type.to_sym)
            raise ArgumentError,
                  "Valid credit cards argument can be left blank or include #{valid_tokens.join(', ')}"
          end
        end

        fetch('stripe.valid_tokens.' + card_type)
      end

      ##
      # Produces a random invalid card number.
      #
      # @return [String]
      #
      # @example
      #   Faker::Stripe.invalid_card #=> "4000000000000002"
      #   Faker::Stripe.invalid_card(card_error: "addressZipFail") #=> "4000000000000010"
      #
      # @deprecated Use the Faker::Business.invalid_card_number method instead.
      #
      # @faker.version 1.9.0
      def invalid_card(legacy_card_error = NOT_GIVEN, card_error: nil)
        Faker::Business.invalid_card_number(legacy_card_error, card_error: card_error)
      end
      deprecate :invalid_card, 'Faker::Business.invalid_card_number', 2020, 6

      ##
      # Produces a random month in two digits format.
      #
      # @return [String]
      #
      # @example
      #   Faker::Stripe.month #=> "10"
      #
      # @deprecated Use the Faker::Business.card_expiry_month method instead.
      #
      # @faker.version 1.9.0
      def month
        Faker::Business.card_expiry_month
      end
      deprecate :month, 'Faker::Business.card_expiry_month', 2020, 6

      ##
      # Produces a random year that is always in the future.
      #
      # @return [String]
      #
      # @example
      #   Faker::Stripe.year #=> "2023" # This will always be a year in the future
      #
      # @deprecated Use the Faker::Business.card_expiry_year method instead.
      #
      # @faker.version 1.9.0
      def year
        Faker::Business.card_expiry_year
      end
      deprecate :year, 'Faker::Business.card_expiry_year', 2020, 6

      ##
      # Produces a random ccv number.
      #
      # @param card_type [String] Specific valid card type.
      # @return [String]
      #
      # @example
      #   Faker::Stripe.ccv #=> "123"
      #   Faker::Stripe.ccv(card_type: "amex") #=> "1234"
      #
      # @deprecated Use the Faker::Business.ccv method instead.
      #
      # @faker.version 1.9.0
      def ccv(legacy_card_type = NOT_GIVEN, card_type: nil)
        Faker::Business.ccv(legacy_card_type, card_type: card_type)
      end
      deprecate :ccv, 'Faker::Business.ccv', 2020, 6
    end
  end
end
