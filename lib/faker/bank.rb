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

      def iban(bank_country_code="GB")
        details = iban_details.find { |country| country["bank_country_code"] == bank_country_code.upcase }
        bcc = details["bank_country_code"] + 2.times.map{ rand(10) }.join
        ilc = (0...details["iban_letter_code"].to_i).map{ (65 + rand(26)).chr }.join
        ib  = details["iban_digits"].to_i.times.map{ rand(10) }.join
        bcc + ilc + ib
      end

      private

      def iban_details
        fetch_all('bank.iban_details')
      end
    end
  end
end

