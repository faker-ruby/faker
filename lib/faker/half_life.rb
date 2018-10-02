# frozen_string_literal: true

module Faker
  class HalfLife < Base
    class << self
      def character
        fetch('half_life.character')
      end

      def enemy
        fetch('half_life.enemy')
      end

      def location
        fetch('half_life.location')
      end
    end
  end
end