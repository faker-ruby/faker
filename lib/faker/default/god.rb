# frozen_string_literal: true


module Faker
  class God < Base

    flexible :god

    class << self
      ##
      # Produces a Greek god name.
      #
      # @return [String]
      #
      # @example
      #   Faker::God.greek_god_name #=> "Zeus"
      #
      # @faker.version 1.4.3
      def greek_god_name
        fetch('god.greek.name')
      end

      ##
      # Produces a Roman god name.
      #
      # @return [String]
      #
      # @example
      #   Faker::God.roman_god_name #=> "Fauno"
      #
      # @faker.version 1.4.3
      def roman_god_name
        fetch('god.roman.name')
      end

      ##
      # Produces a Norse god name.
      #
      # @return [String]
      #
      # @example
      #   Faker::God.norse_god_name #=> "Thor"
      #
      # @faker.version 1.4.3
      def norse_god_name
        fetch('god.norse.name')
      end

      ##
      # Produces a Hindu god name.
      #
      # @return [String]
      #
      # @example
      #   Faker::God.hindu_god_name #=> "Shiva"
      #
      # @faker.version 1.4.3
      def hindu_god_name
        fetch('god.hindu.name')
      end

      ##
      # Produces a Chinese god name.
      #
      # @return [String]
      #
      # @example
      #   Faker::God.chinese_god_name #=> "Mazu"
      #
      # @faker.version 1.4.3
      def chinese_god_name
        fetch('god.chinese.name')
      end
      
      ##
      # Produces a Mayan god name.
      #
      # @return [String]
      #
      # @example
      #   Faker::God.mayan_god_name #=> "Ah Puch"
      #
      # @faker.version 1.4.3
      def mayan_god_name
        fetch('god.mayan.name')
      end

      ##
      # Produces a Egyptian god name.
      #
      # @return [String]
      #
      # @example
      #   Faker::God.egyptian_god_name #=> "Khonshu"
      #
      # @faker.version 1.4.3
      def egyptian_god_name
        fetch('god.egyptian.name')
      end

      ##
      # Produces a Aztec god name.
      #
      # @return [String]
      #
      # @example
      #   Faker::God.aztec_god_name #=> "Khonshu"
      #
      # @faker.version 1.4.3
      def aztec_god_name
        fetch('god.aztec.name')
      end

       ##
      # Produces a Mythology Name.
      #
      # @return [String]
      #
      # @example
      #   Faker::God.mythology #=> "Norse"
      #
      # @faker.version 1.4.3
      def mythology
        fetch('god.mythology')
      end
    end
  end
end
