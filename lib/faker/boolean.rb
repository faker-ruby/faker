module Faker
  class Boolean < Base
    class << self
      def boolean(true_ratio = 0.5)
        (Faker::Config.random.rand < true_ratio)
      end
    end
  end
end
