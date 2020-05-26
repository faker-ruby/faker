# frozen_string_literal: true

module Faker
  class PhoneNumber < Base
    LOCAL = 'local'
    INTL = 'intl'

    class << self
      ##
      # Produces a random phone number in a random format (may or may not have a country code, extension and can have different dividers).
      #
      # @param type [String] Type of phone_number to generate (local or International)
      # @return [String]
      #
      # @example
      #   Faker::PhoneNumber.phone_number(type = LOCAL) #=> "333-333-3333"
      #   Faker::PhoneNumber.phone_number(type = INTL) #=> "+1-333-333-3333"
      #
      # @faker.version next
      def phone_number(type = LOCAL)
        parse("contact_number.phone_number.formats.#{type}")
      end

      ##
      # Produces a random cell phone number in a random format (may or may not have a country code and can have different dividers).
      #
      # @param type [String] Type of cell_phone to generate (local or International)
      # @return [String]
      #
      # @example
      #   Faker::PhoneNumber.cell_phone(type = LOCAL) #=> "333-333-3333"
      #   Faker::PhoneNumber.cell_phone(type = INTL) #=> "+1-333-333-3333"
      #
      # @faker.version next
      def cell_phone(type = LOCAL)
        parse("contact_number.cell_phone.formats.#{type}")
      end

      ##
      # Produces a random country code.
      #
      # @return [String]
      #
      # @example
      #   Faker::PhoneNumber.country_code #=> "+20"
      #
      # @faker.version 1.9.2
      def country_code
        fetch('contact_number.country_code')
      end

      ##
      # Produces a random phone number with country code.
      #
      # @return [String]
      #
      # @example
      #   Faker::PhoneNumber.phone_number_with_country_code #=> "+95 1-672-173-8153"
      #
      # @faker.version 1.9.2
      def phone_number_with_country_code
        "#{country_code}#{phone_number(INTL)}"
      end

      ##
      # Produces a random cell phone number with country code.
      #
      # @return [String]
      #
      # @example
      #   Faker::PhoneNumber.cell_phone_with_country_code #=> "+974 (190) 987-9034"
      #
      # @faker.version 1.9.2
      def cell_phone_with_country_code
        "#{country_code}#{cell_phone(INTL)}"
      end

      ##
      # Produces a random phone number in e164 format.
      #
      # @return [String]
      #
      # @example
      #   Faker::PhoneNumber.cell_phone_in_e164 #=> "+944937040625"
      #
      # @faker.version 1.9.2
      def cell_phone_in_e164
        cell_phone_with_country_code.delete('^+0-9')
      end

      ##
      # Produces a random US, Mexico or Canada-based area code.
      #
      # @return [String]
      #
      # @example
      #   Faker::PhoneNumber.area_code #=> "201"
      #
      # @faker.version 1.3.0
      def area_code
        fetch('contact_number.area_code')
      rescue I18n::MissingTranslationData
        nil
      end

      ##
      # Produces a random US, Mexico or Canada-based exchange code.
      #
      # @return [String]
      #
      # @example
      #   Faker::PhoneNumber.exchange_code #=> "208"
      #
      # @faker.version 1.3.0
      def exchange_code
        fetch('contact_number.exchange_code')
      rescue I18n::MissingTranslationData
        nil
      end

      ##
      # Produces a random US, Mexico or Canada-based extension / subscriber number. Can be used for both extensions and last four digits of phone number.
      #
      # @param length [Integer] Speficies the length of the return value.
      # @return [String]
      #
      # @example
      #   Faker::PhoneNumber.subscriber_number #=> "3873"
      #   Faker::PhoneNumber.subscriber_number(length: 2) #=> "39"
      #   Faker::PhoneNumber.extension #=> "3764"
      #
      # @faker.version 1.3.0
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
