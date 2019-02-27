# frozen_string_literal: true

module Faker
  module JapaneseMedia
    class JojosBizarreAdventure < Base
      class << self
        def protagonist
          fetch('jojos_bizarre_adventure.protagonists')
        end

        def antagonist
          fetch('jojos_bizarre_adventure.antagonists')
        end

        def ally
          fetch('jojos_bizarre_adventure.allies')
        end

        def stand
          fetch('jojos_bizarre_adventure.stands')
        end

        def quote
          fetch('jojos_bizarre_adventure.quotes')
        end
      end
    end
  end
end
