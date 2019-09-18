# frozen_string_literal: true

module Faker
  class Coin < Base
    class << self
      def name
        fetch('currency.name')
      end

      def flip
        fetch('coin.flip')
      end
    end
  end
end
