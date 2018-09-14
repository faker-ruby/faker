# frozen_string_literal: true

module Faker
  class Robin < Base
    class << self
      def quote
        fetch('robin.quotes')
      end
    end
  end
end
