module Faker
  class ElderScrolls < Base
    class << self
      def race
        fetch('elder_scrolls.race')
      end

      def creature
        fetch('elder_scrolls.creature')
      end

      def region
        fetch('elder_scrolls.region')
      end

      def dragon
        fetch('elder_scrolls.dragon')
      end
    end
  end
end
