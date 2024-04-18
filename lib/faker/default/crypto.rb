# frozen_string_literal: true

require 'openssl'

module Faker
  class Crypto < Base
    class << self
      ##
      # Produces an MD5 hash.
      #
      # @return [String]
      #
      # @example
      #   Faker::Crypto.md5 #=> "6b5ed240042e8a65c55ddb826c3408e6"
      #
      # @faker.version 1.6.4
      def md5
        # The MD5 algorithm will experience a collision much sooner
        # than Lorem.characters(number: 5) will. Setting the lorem
        # character number lower than the default of 255 reduces the
        # time complexity of this method while still returning
        # deterministically unique values. Mathematical proof:
        # 4^36 < 32^16 by -1204203453131759529492480
        # 5^36 > 32^16 by 13342989408752222631934449
        OpenSSL::Digest::MD5.hexdigest(Lorem.characters(number: 25))
      end

      ##
      # Produces a SHA1 hash.
      #
      # @return [String]
      #
      # @example
      #   Faker::Crypto.sha1 #=> "4e99e31c51eef8b2d290e709f757f92e558a503f"
      #
      # @faker.version 1.6.4
      def sha1
        # 5^36 < 40^16 by   -28397757731633148193359375
        # 6^36 > 40^16 by 10271475125530535546171949056
        OpenSSL::Digest::SHA1.hexdigest(Lorem.characters(number: 31))
      end

      ##
      # Produces a SHA256 hash.
      #
      # @return [String]
      #
      # @example
      #   Faker::Crypto.sha256 #=> "51e4dbb424cd9db1ec5fb989514f2a35652ececef33f21c8dd1fd61bb8e3929d"
      #
      # @faker.version 1.6.4
      def sha256
        # 6^36 < 64^16 by  -68913737715773802047372001280
        # 7^36 > 64^16 by 2572502683345389134185479431265
        OpenSSL::Digest::SHA256.hexdigest(Lorem.characters(number: 50))
      end

      ##
      # Produces a SHA512 hash.
      #
      # @return [String]
      #
      # @example
      #   Faker::Crypto.sha512 #=> "7b9fc82a6642874833d01b74a7b4fae3d15373193b55cfba47327f8f0afdc8d0ea155b58639a03a887009ef997dab8dd8d36767620d430f6e787e5996e26da80"
      #
      # @faker.version next
      def sha512
        # 8^36 < 128^16 by -4867778304876400901747340308643840
        # 9^36 > 128^16 by 17336102686404346783309651545552545
        OpenSSL::Digest::SHA512.hexdigest(Lorem.characters(number: 100))
      end
    end
  end
end
