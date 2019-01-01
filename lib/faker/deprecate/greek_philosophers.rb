# frozen_string_literal: true

module Faker
  class GreekPhilosophers < Base
    class << self
      extend Gem::Deprecate

      def name
        Faker::Quotes::GreekPhilosophers.name
      end

      def quote
        Faker::Quotes::GreekPhilosophers.quote
      end

      deprecate :name, 'Faker::Quotes::GreekPhilosophers.name', 2018, 12
      deprecate :quote, 'Faker::Quotes::GreekPhilosophers.quote', 2018, 12
    end
  end
end
