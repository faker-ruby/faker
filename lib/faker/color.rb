module Faker
  class Color < Base

    class << self
      def hex
        "##{SecureRandom.hex(3)}"
      end
    end
  end
end
