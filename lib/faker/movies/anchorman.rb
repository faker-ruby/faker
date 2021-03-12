module Faker
  class Anchorman < Base
    class << self
      def character
        fetch('anchorman.characters')
      end

      def character
        fetch('anchorman.quote')
      end
    end
  end
end