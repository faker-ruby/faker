module Faker
  class Wrestling < Base
    class << self
      def name
        fetch('wrestling.names')
      end

      def move
        fetch('wrestling.moves')
      end
    end
  end
end
