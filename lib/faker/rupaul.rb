module Faker
  class RuPaul < Base
    flexible :rupaul

    class << self
      def quote
        fetch('rupaul.quotes')
      end
    end
  end
end
