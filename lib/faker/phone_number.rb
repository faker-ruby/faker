module Faker
  class PhoneNumber < Base
    class << self
      def phone_number
        numerify(fetch('phone_number.formats'))
      end
    end
  end
end