# frozen_string_literal: true

module Faker
  module Games
    class Heroes < Base
      class << self
        def name
          fetch('heroes.names')
        end

        def specialty
          fetch('heroes.specialties')
        end

        def klass
          fetch('heroes.klasses')
        end
      end
    end
  end
end
