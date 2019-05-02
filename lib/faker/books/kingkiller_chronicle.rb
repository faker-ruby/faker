# frozen_string_literal: true

module Faker
  class Books
    class KingkillerChronicle < Base
      class << self
        def character
          fetch('kingkiller_chronicle.character')
        end

        def city
          fetch('kingkiller_chronicle.city')
        end

        def quote
          fetch('kingkiller_chronicle.quote')
        end
      end
    end
  end
end
