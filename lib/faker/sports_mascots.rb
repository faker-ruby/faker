module Faker
  class SportsMascots < Base
    class << self
      def mascot
        fetch('sports_mascots.mascot')
      end
    end
  end
end