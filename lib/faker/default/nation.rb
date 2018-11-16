# frozen_string_literal: true

module Faker
  class Nation < Base
    flexible :nation
    class << self
      # Fetch random nationality
      def nationality
        fetch('nation.nationality')
      end

      # Fetch random national flag emoji
      def flag
        sample(translate('faker.nation.flag')).pack('C*').force_encoding('utf-8')
      end

      # Fetch random language
      def language
        fetch('nation.language')
      end

      # Fetch random capital city
      def capital_city
        fetch('nation.capital_city')
      end

      # Fetch random natinal sport
      def national_sport
        fetch('team.sport')
      end
    end
  end
end
