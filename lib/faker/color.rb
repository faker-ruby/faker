module Faker
  class Color < Base
    class << self
      def hex_color
        color = "#%06x" % (rand * 0xffffff)
      end
    end

  end
end
