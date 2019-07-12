# frozen_string_literal: true

module Faker
  module Religion
    class Bible < Base
      flexible :bible

      class << self
        def character
          fetch('bible.character')
        end

        def location
          fetch('bible.location')
        end

        def quote
          fetch('bible.quote')
        end
      end
    end
  end
end
