require 'digest'
require 'securerandom'

module Faker
  class Bitcoin < Base
    class << self

      PROTOCOL_VERSIONS = {
        main: 0,
        testnet: 111
      }

      def address
        version = PROTOCOL_VERSIONS[:main]
        address_for_version(version)
      end

      def testnet_address
        version = PROTOCOL_VERSIONS[:testnet]
        address_for_version(version)
      end

      protected

      def base58(str)
        alphabet = '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz'
        base = alphabet.size

        lv = 0
        str.split('').reverse.each_with_index { |v,i| lv += v.unpack('C')[0] * 256**i }

        ret = ''
        while lv > 0 do
          lv, mod = lv.divmod(base)
          ret << alphabet[mod]
        end

        npad = str.match(/^#{0.chr}*/)[0].to_s.size
        '1'*npad + ret.reverse
      end

      def address_for_version(version)
        hash = SecureRandom.hex(20)
        packed = version.chr + [hash].pack("H*")
        checksum = Digest::SHA2.digest(Digest::SHA2.digest(packed))[0..3]
        base58(packed + checksum)
      end
    end
  end
end
