module Faker
  class Car < Base

    class << self
    
      def license_plate
        "#{plate_characters} #{plate_digits}"
      end

      private

      def plate_characters
        (0..2).map { (65 + rand(25)).chr }.join
      end

      def plate_digits
        (100..999)
      end
    end
  end
end
