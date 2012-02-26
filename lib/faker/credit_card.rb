module Faker
  class CreditCard < Base
    class << self
      VISA_TOTAL_LENGTH = 16

      def number(card_type)
        "4" + generate_string_digits(VISA_TOTAL_LENGTH - 1)
      end

      private

      def generate_string_digits(quantity)
        (0...quantity).map{ rand(10).to_s }.join
      end
    end   
  end
end
