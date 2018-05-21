module Faker
  class SingularSiegler < Base
    class << self
      def quotes
        fetch('singular_siegler.quotes')
      end
    end
  end
end
