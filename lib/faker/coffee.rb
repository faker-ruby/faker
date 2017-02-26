module Faker
  class Coffee < Base
    flexible :coffee

    class << self
      def silly_blend_name
        parse('coffee.silly_blend_name')
      end

      def origin
        country = fetch('coffee.country')
        search_country = country.downcase
        search_country.split(' ').join('_') if search_country.split(' ').length > 1
        region = fetch("coffee.regions.#{search_country}")
        "#{region}, #{country}"
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
