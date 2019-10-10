# frozen_string_literal: true

module Faker
  # A generator of titles of operas by Verdi, Rossini, Donizetti and Bellini
  class Music
    class Opera < Base
      class << self
        def verdi
          fetch('opera.italian.by_giuseppe_verdi')
        end

        def rossini
          fetch('opera.italian.by_gioacchino_rossini')
        end

        def donizetti
          fetch('opera.italian.by_gaetano_donizetti')
        end

        def bellini
          fetch('opera.italian.by_vincenzo_bellini')
        end
      end
    end
  end
end
