# frozen_string_literal: true

module Faker
  class JapaneseMedia
    class DemonSlayer < Base

      class << self
        def character
          fetch('demon_slayer.character')
        end

        def episode
          fetch('demon_slayer.location')
        end

      end
    end
  end
end
