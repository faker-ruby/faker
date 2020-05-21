# frozen_string_literal: true

module Faker
  class PhoneNumber < Base
    LOCAL = 'local'
    INTL = 'intl'

    class << self
      ##
      # Generates a random phone number
      #
      # @param type [String] Type of phone_number to generate (local or International)
      # @return [String]
      #
      # @example
      #   Faker::PhoneNumber.phone_number(type = LOCAL) #=> "333-333-3333"
      #   Faker::PhoneNumber.phone_number(type = INTL) #=> "+1-333-333-3333"
      #
      # @faker.version 2.11.0
      def phone_number(type = LOCAL)
        parse("contact_number.phone_number.formats.#{type}")
      end

      ##
      # Generates a random cellphone number
      #
      # @param type [String] Type of cell_phone to generate (local or International)
      # @return [String]
      #
      # @example
      #   Faker::PhoneNumber.cell_phone(type = LOCAL) #=> "333-333-3333"
      #   Faker::PhoneNumber.cell_phone(type = INTL) #=> "+1-333-333-3333"
      #
      # @faker.version 2.11.0
      def cell_phone(type = LOCAL)
        parse("contact_number.cell_phone.formats.#{type}")
      end

      def country_code
        fetch('contact_number.country_code')
      end

      def phone_number_with_country_code
        "#{country_code}#{phone_number(INTL)}"
      end

      def cell_phone_with_country_code
        "#{country_code}#{cell_phone(INTL)}"
      end

      def cell_phone_in_e164
        cell_phone_with_country_code.delete('^+0-9')
      end

      # US, Canada and Mexico only
      def area_code
        fetch('contact_number.area_code')
      rescue I18n::MissingTranslationData
        nil
      end

      # US, Canada and Mexico only
      def exchange_code
        fetch('contact_number.exchange_code')
      rescue I18n::MissingTranslationData
        nil
      end

      # US, Canada and Mexico only
      # Can be used for both extensions and last four digits of phone number.
      # Since extensions can be of variable length, this method taks a length parameter
      def subscriber_number(legacy_length = NOT_GIVEN, length: 4)
        warn_for_deprecated_arguments do |keywords|
          keywords << :length if legacy_length != NOT_GIVEN
        end

        rand.to_s[2..(1 + length)]
      end

      alias extension subscriber_number
    end
  end
end
