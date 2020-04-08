# frozen_string_literal: true

module Faker
  class Computer < Base
    class << self
      ##
      # Produces the name of a computer platform.
      #
      # @return [String]
      #
      # @example
      #   Faker::Computer.platform #=> "Linux"
      #
      # @faker.version next
      def platform
        fetch('computer.platform')
      end

      ##
      # Produces the name of a computer type.
      #
      # @return [String]
      #
      # @example
      #   Faker::Computer.type #=> "server"
      #
      # @faker.version next
      def type
        fetch('computer.type')
      end

      ##
      # Produces the name of a computer os.
      #
      # @param platform [String] optionally specify the platform
      # @return [String]
      #
      # @example
      #   Faker::Computer.os #=> "RHEL 6.10"
      #
      # @faker.version next
      def os(platform:)
        platform = self.platform unless fetch_all('computer.platform').include?(platform)
        platform = search_format(platform)
        fetch("computer.#{platform}.os")
      end

      ##
      # Produces a string with computer platform and os
      #
      # @return [String]
      #
      # @example
      #   Faker::Computer.stack #=> "Linux, RHEL 6.10"
      #
      # @faker.version next
      def stack
        platform = self.platform
        os = fetch("computer.os.#{search_format(platform)}")
        "#{platform}, #{os}"
      end

      private
      # Produces a string compatible with key format from a platform
      #
      # @!visibility private
      # @return [String]
      #
      # @example
      #   search_format(OS X) #=> "os_x"
      #
      # @faker.version next
      def search_format(key)
        key.split.length > 1 ? key.split.join('_').downcase : key.downcase
      end
    end
  end
end
