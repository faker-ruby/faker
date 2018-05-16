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

      def iban(country_code = 'GB')
        # Each country has it's own format for bank accounts
        # Many of them use letters in certain parts of the account
        # Using regex patterns we can create virtually any type of bank account
        begin
          pattern = fetch("bank.iban_details.#{country_code.downcase}.bban_pattern")
        rescue I18n::MissingTranslationData
          raise ArgumentError, "Could not find iban details for #{country_code}"
        end

        # Use Faker::Base.regexify for creating a sample from bank account format regex
        account = Base.regexify(/#{pattern}/)

        # Add country code and checksum to the generated account to form valid IBAN
        country_code.upcase + iban_checksum(country_code, account) + account
      end

      private

      # Calculates the mandatory checksum in 3rd and 4th characters in IBAN format
      # source: https://en.wikipedia.org/wiki/International_Bank_Account_Number#Validating_the_IBAN
      def iban_checksum(country_code, account)
        # Converts letters to numbers according the iban rules, A=10..Z=35
        account_to_number = "#{account}#{country_code}00".upcase.chars.map do |d|
          d =~ /[A-Z]/ ? (d.ord - 55).to_s : d
        end.join.to_i

        # This is answer to (iban_to_num + checksum) % 97 == 1
        checksum = (1 - account_to_number) % 97

        # Use leftpad to make the size always to 2
        checksum.to_s.rjust(2, '0')
      end
    end
  end
end
