module Faker
  class Educator < Base
    flexible :educator

    class << self
      def university
        "#{fetch('educator.name')} #{fetch('educator.tertiary')}"
      end

      def secondary_school
        "#{fetch('educator.name')} #{fetch('educator.secondary')}"
      end
    end
  end
end
