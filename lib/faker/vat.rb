module Faker
  class Vat < Base
    class NoExistCountryError < StandardError; end
    
    class << self

      # Generate VAT identification number for given country.
      # E.g. Faker::Vat.number :poland
      #
      def number country
        begin
          constantize("Faker::Vat::#{country.capitalize}").number
        rescue NameError 
          raise NoExistCountryError 
        end
      end

    end
  end
end

Dir[File.dirname(__FILE__) + '/vat/**/*.rb'].each {|f| require f}
