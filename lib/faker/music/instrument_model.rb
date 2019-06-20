# frozen_string_literal: true

module Faker
  class Music
    class InstrumentModel < Base
      class << self
        def name
          fetch('instrument_model.name')
        end

        def company
          fetch('instrument_model.company')
        end
      end
    end
  end
end
