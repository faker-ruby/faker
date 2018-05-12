module Faker
  class Nation < Base
    flexible :nation
    class << self
      def nationality
        fetch('nation.nationality')
      end

      def language
        fetch('nation.language')
      end
    end
  end
end
