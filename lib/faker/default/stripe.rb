# frozen_string_literal: true

module Faker
  class Stripe < Base
    class << self
      def valid_card(legacy_card_type = NOT_GIVEN, card_type: nil)
        warn_for_deprecated_arguments do |keywords|
          keywords << :card_type if legacy_card_type != NOT_GIVEN
        end

        valid_cards = translate('faker.stripe.valid_cards').keys

        if card_type.nil?
          card_type = sample(valid_cards).to_s
        else
          unless valid_cards.include?(card_type.to_sym)
            raise ArgumentError,
                  "Valid credit cards argument can be left blank or include #{valid_cards.join(', ')}"
          end
        end

        fetch('stripe.valid_cards.' + card_type)
      end

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

      def invalid_card(legacy_card_error = NOT_GIVEN, card_error: nil)
        warn_for_deprecated_arguments do |keywords|
          keywords << :card_error if legacy_card_error != NOT_GIVEN
        end

        invalid_cards = translate('faker.stripe.invalid_cards').keys

        if card_error.nil?
          card_error = sample(invalid_cards).to_s
        else
          unless invalid_cards.include?(card_error.to_sym)
            raise ArgumentError,
                  "Invalid credit cards argument can be left blank or include #{invalid_cards.join(', ')}"
          end
        end

        fetch('stripe.invalid_cards.' + card_error)
      end

      def month
        format('%02d', rand_in_range(1, 12))
      end

      def year
        start_year = ::Time.new.year + 1
        rand_in_range(start_year, start_year + 5).to_s
      end

      def ccv(legacy_card_type = NOT_GIVEN, card_type: nil)
        warn_for_deprecated_arguments do |keywords|
          keywords << :card_type if legacy_card_type != NOT_GIVEN
        end

        (card_type.to_s == 'amex' ? rand_in_range(1000, 9999) : rand_in_range(100, 999)).to_s
      end
    end
  end
end
