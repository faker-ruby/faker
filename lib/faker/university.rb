module Faker
  class University < Base
    flexible :university

    class << self
      def name
        parse('university.name')
      end

      def prefix
        fetch('university.prefix')
      end

      def suffix
        fetch('university.suffix')
      end

    end
  end
end
