module Faker
  class Finance < Base
    class << self
      def vat_number(country=nil)
        country = nil unless country and I18n.t('faker.vat_number').include?(country.to_sym)
        country ||= I18n.t('faker.vat_number').keys.sample
        #country = country.iso_3166_1_alpha2 if country.kind_of?(Faker::Country)

        bothify fetch("vat_number.#{country}"), true
      end
    end
  end
end
