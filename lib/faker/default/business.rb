# frozen_string_literal: true

require 'date'

module Faker
  class Business < Base
    flexible :business

    class << self
      extend Gem::Deprecate

      ##
      # Produces a card expiration date.
      #
      # @return [Date]
      #
      # @example
      #   Faker::Business.card_expiry_date #=> <Date: 2015-11-11 ((2457338j,0s,0n),+0s,2299161j)>
      #
      # @faker.version 2.13.0
      def card_expiry_date
        ::Date.today + (365 * rand(1..4))
      end

      ##
      # Produces a credit card expiration date.
      #
      # @return [Date]
      #
      # @example
      #   Faker::Business.credit_card_expiry_date #=> <Date: 2015-11-11 ((2457338j,0s,0n),+0s,2299161j)>
      #
      # @deprecated Use the card_expiry_date method instead.
      #
      # @faker.version 1.2.0
      alias credit_card_expiry_date card_expiry_date
      deprecate :credit_card_expiry_date, :card_expiry_date, 2020, 6

      ##
      # Produces a random card expiry month in two digits format.
      #
      # @return [String]
      #
      # @example
      #   Faker::Business.card_expiry_month #=> "10"
      #
      # @faker.version 2.13.0
      def card_expiry_month
        format('%02d', rand_in_range(1, 12))
      end

      ##
      # Produces a random card expiry year that is always in the future.
      #
      # @return [String]
      #
      # @example
      #   Faker::Business.card_expiry_year #=> "2023" # This will always be a year in the future
      #
      # @faker.version 2.13.0
      def card_expiry_year
        start_year = ::Time.new.year + 1
        rand_in_range(start_year, start_year + 3).to_s
      end

      ##
      # Produces a type of a card.
      #
      # @return [String]
      #
      # @example
      #   Faker::Business.card_type #=> "visa_debit"
      #
      # @faker.version 1.2.0
      def card_type
        sample(translate('faker.business.valid_cards').keys).to_s
      end

      ##
      # Produces a type of credit card.
      #
      # @return [String]
      #
      # @example
      #   Faker::Business.credit_card_type #=> "visa"
      #
      # @deprecated Use the card_type method instead.
      #
      # @faker.version 1.2.0
      alias credit_card_type card_type
      deprecate :credit_card_type, :card_type, 2020, 6

      ##
      # Produces a brand of a card.
      #
      # @return [String]
      #
      # @example
      #   Faker::Business.card_brand #=> "visa"
      #
      # @faker.version 2.13.0
      def card_brand
        fetch('business.card_brands')
      end

      ##
      # Produces a random valid card number.
      #
      # @param card_type [String] Specific valid card type.
      # @return [String]
      #
      # @example
      #   Faker::Business.valid_card_number #=> "4242424242424242"
      #   Faker::Business.valid_card_number(card_type: "visa_debit") #=> "4000056655665556"
      #
      # @faker.version 2.13.0
      def valid_card_number(legacy_card_type = NOT_GIVEN, card_type: nil)
        warn_for_deprecated_arguments do |keywords|
          keywords << :card_type if legacy_card_type != NOT_GIVEN
        end

        valid_cards = translate('faker.business.valid_cards').keys

        if card_type.nil?
          card_type = sample(valid_cards).to_s
        else
          unless valid_cards.include?(card_type.to_sym)
            raise ArgumentError,
                  "Valid credit cards argument can be left blank or include #{valid_cards.join(', ')}"
          end
        end

        fetch('business.valid_cards.' + card_type)
      end

      ##
      # Produces a random valid card number.
      #
      # @return [String]
      #
      # @example
      #   Faker::Business.credit_card_number #=> "1228-1221-1221-1431"
      #
      # @deprecated Use the valid_card_number method instead.
      #
      # @faker.version 1.2.0
      def credit_card_number
        credit_card_type = Faker::Base.sample(%w[visa mc amex discover diners_club jcb])
        credit_card_number_without_hyphens = valid_card_number(card_type: credit_card_type)
        (1...3).reduce(credit_card_number_without_hyphens.to_s) do |card_number, index|
          card_number.insert(index * 4, '-')
        end
      end
      deprecate :credit_card_number, :valid_card_number, 2020, 6

      ##
      # Produces a random invalid card number.
      #
      # @return [String]
      #
      # @example
      #   Faker::Business.invalid_card_number #=> "4000000000000002"
      #   Faker::Business.invalid_card_number(card_error: "addressZipFail") #=> "4000000000000010"
      #
      # @faker.version 2.13.0
      def invalid_card_number(legacy_card_error = NOT_GIVEN, card_error: nil)
        warn_for_deprecated_arguments do |keywords|
          keywords << :card_error if legacy_card_error != NOT_GIVEN
        end

        invalid_cards = translate('faker.business.invalid_cards').keys

        if card_error.nil?
          card_error = sample(invalid_cards).to_s
        else
          unless invalid_cards.include?(card_error.to_sym)
            raise ArgumentError,
                  "Invalid credit cards argument can be left blank or include #{invalid_cards.join(', ')}"
          end
        end

        fetch('business.invalid_cards.' + card_error)
      end

      ##
      # Produces a random ccv number.
      #
      # @param card_type [String] Specific valid card type.
      # @return [String]
      #
      # @example
      #   Faker::Business.ccv #=> "123"
      #   Faker::Business.ccv(card_type: "amex") #=> "1234"
      #
      # @faker.version 2.13.0
      def ccv(legacy_card_type = NOT_GIVEN, card_type: nil)
        warn_for_deprecated_arguments do |keywords|
          keywords << :card_type if legacy_card_type != NOT_GIVEN
        end

        (card_type.to_s == 'amex' ? rand_in_range(1000, 9999) : rand_in_range(100, 999)).to_s
      end
    end
  end
end
