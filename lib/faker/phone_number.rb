module Faker
  class PhoneNumber < Base
    class << self
      def phone_number
        numerify(I18n.translate('faker.phone_number.formats').rand)
      end
    end
  end
end