module Faker
    class Science < Base
      class << self
        def elements
          fetch('science.elements')
        end
  
      end
    end
  end
  