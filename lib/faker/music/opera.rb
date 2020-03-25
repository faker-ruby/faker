# frozen_string_literal: true

module Faker
  # A generator of titles of operas by Verdi, Rossini, Donizetti and Bellini
  class Music
    class Opera < Base
      class << self
        ##
        # Produces the title of an opera by Giuseppe Verdi.
        #
        # @return [String]
        #
        # @example
        #   Faker::Music::Opera.verdi #=> "Il Trovatore"
        #
        # @faker.version 1.9.4
        def verdi
          fetch('opera.italian.by_giuseppe_verdi')
        end

        ##
        # Produces the title of an opera by Gioacchino Rossini.
        #
        # @return [String]
        #
        # @example
        #   Faker::Music::Opera.rossini #=> "Il Barbiere di Siviglia"
        #
        # @faker.version 1.9.4
        def rossini
          fetch('opera.italian.by_gioacchino_rossini')
        end

        ##
        # Produces the title of an opera by Gaetano Donizetti.
        #
        # @return [String]
        #
        # @example
        #   Faker::Music::Opera.donizetti #=> "Lucia di Lammermoor"
        #
        # @faker.version 1.9.4
        def donizetti
          fetch('opera.italian.by_gaetano_donizetti')
        end

        ##
        # Produces the title of an opera by Vincenzo Bellini.
        #
        # @return [String]
        #
        # @example
        #   Faker::Music::Opera.bellini #=> "Norma"
        #
        # @faker.version 1.9.4
        def bellini
          fetch('opera.italian.by_vincenzo_bellini')
        end
      end
    end
  end
end
