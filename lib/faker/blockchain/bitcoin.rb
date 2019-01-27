# frozen_string_literal: true

require 'digest'
require 'securerandom'

module Faker
  class Blockchain
    class Bitcoin < Base
      class << self
        PROTOCOL_VERSIONS = {
          main: 0,
          testnet: 111
        }.freeze

        def address
          address_for(:main)
        end

        def testnet_address
          address_for(:testnet)
        end

        protected

        def address_for(network)
          version = PROTOCOL_VERSIONS.fetch(network)
          packed = version.chr + Faker::Config.random.bytes(20)
          checksum = Digest::SHA2.digest(Digest::SHA2.digest(packed))[0..3]
          Faker::Base58.encode(packed + checksum)
        end
      end
    end
  end
end
