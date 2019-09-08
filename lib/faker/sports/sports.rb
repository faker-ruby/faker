# frozen_string_literal: true

module Faker
  class Sports < Base
    class << self
      def name
        fetch('sports.name')
      end
    end
  end
end
