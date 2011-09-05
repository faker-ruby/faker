module Faker
  class PhoneNumber < Base
    class << self
      def phone_number
        numerify(fetch('phone_number.formats'))
      end

      def cell_phone
        if (translation = translate(:faker)[:cell_phone]).is_a? Hash
          numerify(translation[:formats].sample)
        else
          numerify(fetch('phone_number.formats'))
        end
      end
    end
  end
end
