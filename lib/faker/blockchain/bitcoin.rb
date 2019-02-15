# frozen_string_literal: true

require 'digest'
require 'securerandom'

module Faker
  class Blockchain
    # @faker.version 1.9.2
    class Bitcoin < Base
      class << self
        # @private
        PROTOCOL_VERSIONS = {
          main: 0,
          testnet: 111
        }.freeze

        ##
        # @return [string] A Bitcoin wallet address
        #
        # @example
        #   "147nDP22h3pHrLt2qykTH4txUwQh1ccaXp"
        #   "1PmjxnDM2oGusc8R776s8hNxdtAsNTnWrv"
        #   "1CJ8rPhaTbTAP16kzdiHoayEPg6UFMjXhT"
        def address
          address_for(:main)
        end

        ##
        # @return [string] A Bitcoin testnet address
        #
        # @example
        #   "n4YjRyYD6V6zREpk6opqESDqD3KYnMdVEB"
        #   "miVEG5z3yoTe8p3Bjh9kh8MBQMb4QZ7d2w"
        #   "n4PTm5skAEnieUve9wmDxtaLZ9UhCXVDzT"
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
