require 'date'

module Faker
  class CreditCard < Base
    class << self
      VISA_TOTAL_LENGTH = 16
      MAXIMUM_EXPIRATION_DISTANCE = 48

      def number(card_type)
        "4" + generate_string_digits(VISA_TOTAL_LENGTH - 1)
      end

      def expiration_date
        months_to_advance = rand(1..MAXIMUM_EXPIRATION_DISTANCE)
        exp = Date.today >> months_to_advance
        exp.strftime("%m/%y")
      end

      private

      def generate_string_digits(quantity, values = (0...10))
        (0...quantity).map{ rand(values).to_s }.join
      end
    end   
  end
end
