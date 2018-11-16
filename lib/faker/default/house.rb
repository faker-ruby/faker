# frozen_string_literal: true

module Faker
  class House < Base
    class << self
      def furniture
        fetch('house.furniture')
      end

      def room
        fetch('house.rooms')
      end
    end
  end
end
