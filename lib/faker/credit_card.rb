require 'date'

module Faker
  class CreditCard < Base
    VISA_TOTAL_LENGTH = MASTERCARD_TOTAL_LENGTH = 16
    AMEX_TOTAL_LENGTH = 15
    MAXIMUM_EXPIRATION_DISTANCE = 48
    DEFAULT_CARD_TYPE = :visa

    def self.number(card_type = DEFAULT_CARD_TYPE)
      case card_type.to_s
        when "visa" then "4" + generate_string_digits(VISA_TOTAL_LENGTH - 1)
        when "amex" then "3" + generate_string_digits(AMEX_TOTAL_LENGTH - 1)
        when "mastercard" then "5" + generate_string_digits(MASTERCARD_TOTAL_LENGTH - 1)
      end
    end

    def self.expiration_date
      months_to_advance = rand(1..MAXIMUM_EXPIRATION_DISTANCE)
      exp = Date.today >> months_to_advance
      exp.strftime("%m/%y")
    end

    private

    def self.generate_string_digits(quantity)
      (0...quantity).map{ rand(10).to_s }.join
    end
  end
end
