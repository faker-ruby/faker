module Faker
  class Superhero < Base
    class << self
      def power
        fetch('superhero.power')
      end
    end
  end
end
