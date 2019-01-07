# frozen_string_literal: true

module Faker
  class Ethereum < Base
    class << self
      extend Gem::Deprecate

      def address
        Faker::Blockchain::Ethereum.address
      end

      deprecate :address, 'Faker::Blockchain::Ethereum.address', 2019, 01
    end
  end
end
