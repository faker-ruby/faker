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
        # than Lorem.characters(number: 25) will. Setting the lorem
        # character number lower than the default of 255 reduces the
        # time complexity of this method while still returning
        # deterministically unique values. Mathematical proof:
        # 36^24 < 16^32 by -317830109213583906223287396307975536640
        # 36^25 > 16^32 by 467998910543825597179764993024768081920
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
        # 36^30 < 16^40 by -1412627959350213660714362080442508415790271692800
        # 36^31 > 16^40 by 297950769973910351411934249139602719507858063360
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
        # 36^49 < 16^64 by -97644349695647559143107366476519635060571548263614039829927807164315986821120
        # 36^50 > 16^64 by 537526534262754710673119282149369912683873725807314307503614382361584011837440
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
        # 36^99 < 16^128 by   -1551551712941835966324722456017686895729678449634353669515809251079738209250776448494314872034761836111898095223260222216129848353124479880210993674977280
        # 36^100 > 16^128 by 413417415882084803697400866520567886215509379533897036117755517491391165519546192042270265042590193869122783608489643780100711357705648672437581942913761280
        OpenSSL::Digest::SHA512.hexdigest(Lorem.characters(number: 100))
      end
    end
  end
end
