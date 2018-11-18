# frozen_string_literal: true

module Faker
  class Ethereum < Base
    class << self
      extend Gem::Deprecate

      def address
        Faker::Blockchain::Ethereum.address
      end

      deprecate :address, 'Faker::Blockchain::Tezos.address', 2018, 12
    end
  end
end
