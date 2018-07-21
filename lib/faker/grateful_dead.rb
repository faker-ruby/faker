# frozen_string_literal: true

module Faker
  class GratefulDead < Base
    class << self
      def player
        fetch('grateful_dead.player')
      end

      def song
        fetch('grateful_dead.song')
      end
    end
  end
end
