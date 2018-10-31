<<<<<<< HEAD
module Faker
    class Science < Base
      class << self
        def element
          fetch('science.element')
        end
  
        def scientist
            fetch('science.scientist')
        end

      end
    end
  end
  
=======
# frozen_string_literal: true

module Faker
  class Science < Base
    class << self
      def element
        fetch('science.element')
      end

      def element_symbol
        fetch('science.element_symbol')
      end

      def scientist
        fetch('science.scientist')
      end
    end
  end
end
>>>>>>> 723d7807516a425daead8f5e01e74b99515c0d1c
