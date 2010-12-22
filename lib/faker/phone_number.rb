module Faker
  class PhoneNumber
    class << self
      def phone_number
        Faker.numerify(I18n.translate('phone_number.formats').rand)
      end
    end
  end
end