module Faker
  class Stripe < Base
    class << self
      def valid_card(card_type = nil)
        valid_cards = translate('faker.stripe.valid_cards').keys

        if card_type.nil?
          card_type = sample(valid_cards).to_s
        else
          unless valid_cards.include?(card_type.to_sym)
            raise ArgumentError,
              "Valid credit cards argument can be left blank or include #{valid_cards.join(', ')}"
          end
        end

        return fetch('stripe.valid_cards.' + card_type)
      end

      def invalid_card(card_error = nil)
        invalid_cards = translate('faker.stripe.invalid_cards').keys

        if card_error.nil?
          card_error = sample(invalid_cards).to_s
        else
          unless invalid_cards.include?(card_error.to_sym)
            raise ArgumentError,
              "Invalid credit cards argument can be left blank or include #{invalid_cards.join(', ')}"
          end
        end

        return fetch('stripe.invalid_cards.' + card_error)
      end

      def valid_card_object
        sample('stripe.valid_card_objects')
      end

    end
  end
end
