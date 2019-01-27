# frozen_string_literal: true

module Faker
  class Bitcoin
    class << self
      extend Gem::Deprecate

      def address
        Faker::Blockchain::Bitcoin.address
      end

      def testnet_address
        Faker::Blockchain::Bitcoin.testnet_address
      end

      deprecate :address, 'Faker::Blockchain::Bitcoin.address', 2019, 01
      deprecate :testnet_address, 'Faker::Blockchain::Bitcoin.testnet_address', 2019, 01
    end
  end
end
