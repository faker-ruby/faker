# frozen_string_literal: true

require 'digest'
require 'securerandom'

module Faker
  class Blockchain
    class Tezos < Base
      class << self
        PREFIXES = {
          tz1:    [6, 161, 159],
          KT1:    [2, 90, 121],
          edpk:   [13, 15, 37, 217],
          edsk:  [13, 15, 58, 7],
          edsig:  [9, 245, 205, 134, 18],
          o:      [5, 116]
        }.freeze

        def account
          encode_tz(:tz1, 20)
        end

        def contract
          encode_tz(:KT1, 20)
        end

        def operation
          encode_tz(:o, 32)
        end

        def signature
          encode_tz(:edsig, 64)
        end

        protected

        def encode_tz(prefix, payload_size)
          prefix = PREFIXES.fetch(prefix)
          packed = prefix.map(&:chr).join('') + Faker::Config.random.bytes(payload_size)
          checksum = Digest::SHA2.digest(Digest::SHA2.digest(packed))[0..3]
          Faker::Base58.encode(packed + checksum)
        end
      end
    end
  end
end
