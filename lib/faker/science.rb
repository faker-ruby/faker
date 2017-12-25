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
