# frozen_string_literal: true

module Faker
  module Comics
    class Superhero < Base
      flexible :super_hero

      class << self
        def power
          fetch('superhero.power')
        end

        def prefix
          fetch('superhero.prefix')
        end

        def suffix
          fetch('superhero.suffix')
        end

        def descriptor
          fetch('superhero.descriptor')
        end

        def name
          parse('superhero.name')
        end
      end
    end
  end
end
