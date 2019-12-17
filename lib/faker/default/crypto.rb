# frozen_string_literal: true

require 'digest'

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
        Digest::MD5.hexdigest(Lorem.characters)
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
        Digest::SHA1.hexdigest(Lorem.characters)
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
        Digest::SHA256.hexdigest(Lorem.characters)
      end
    end
  end
end
