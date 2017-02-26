module Faker
  class Coffee < Base
    flexible :coffee

    class << self
      def silly_blend_name
        fetch('coffee.silly_blend_name')
      end

      # would be nice if this parsed to a country and region
      def origin
        country = fetch('coffee.country')
        search_country = country.downcase
        search_country.split(' ').join('_') if search_country.split(' ').length > 1
        region = fetch("coffee.regions.#{search_country}")
        "#{region}, #{country}"
      end

      def farm
        fetch('coffee.farm')
      end

      def variety
        fetch('coffee.variety')
      end

      def notes
        parse('coffee.notes')
      end
    end
  end
end
