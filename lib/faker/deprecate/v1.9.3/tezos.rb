# frozen_string_literal: true

require 'digest'
require 'securerandom'

module Faker
  class Tezos
    class << self
      extend Gem::Deprecate

      def account
        Faker::Blockchain::Tezos.account
      end

      def contract
        Faker::Blockchain::Tezos.contract
      end

      def operation
        Faker::Blockchain::Tezos.operation
      end

      def signature
        Faker::Blockchain::Tezos.signature
      end

      deprecate :account, 'Faker::Blockchain::Tezos.account', 2019, 01
      deprecate :contract, 'Faker::Blockchain::Tezos.contract', 2019, 01
      deprecate :operation, 'Faker::Blockchain::Tezos.operation', 2019, 01
      deprecate :signature, 'Faker::Blockchain::Tezos.signature', 2019, 01
    end
  end
end
