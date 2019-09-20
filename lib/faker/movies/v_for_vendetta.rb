# frozen_string_literal: true

module Faker
  class Movies
    class VForVendetta < Base
      class << self
        def character
          fetch('v_for_vendetta.characters')
        end

        def speech
          fetch('v_for_vendetta.speeches')
        end

        def quote
          fetch('v_for_vendetta.quotes')
        end
      end
    end
  end
end
