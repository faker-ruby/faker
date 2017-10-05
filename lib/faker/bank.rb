module Faker
  class Bank < Base
    flexible :bank

    class << self
      def name
        fetch('bank.name')
      end

      def swift_bic
        fetch('bank.swift_bic')
      end

      def iban(country_code = "GB")
        [
          country_code.upcase,
          Array.new(2) { rand(10) },
          iban_range(country_code, :letter_code) { (65 + rand(26)).chr },
          iban_range(country_code, :digits) { rand(10) }
        ].join
      end

      private

      def iban_range(country_code, number_type)
        array_length = iban_length(country_code, number_type)
        Array.new(array_length) { yield }
      end

      def iban_length(country_code, number_type)
        fetch("bank.iban_details.#{country_code.downcase}.#{number_type}").to_i
      rescue I18n::MissingTranslationData
        raise ArgumentError, "Could not find iban details for #{country_code}"
      end
    end
  end
end
