module Faker
  class PhoneNumber < Base
    class << self
      def phone_number
        numerify(fetch('phone_number.formats'))
      end

      def cell_phone
        numerify(fetch('cell_phone.formats'))
      end
    end
  end
end
