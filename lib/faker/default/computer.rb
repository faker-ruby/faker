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
      # @return [String]
      #
      # @example
      #   Faker::Computer.os #=> "RHEL 6.10"
      #
      # @faker.version next
      def os
        fetch('computer.os')
      end

      ##
      # Produces the name of a linux server os.
      #
      # @return [String]
      #
      # @example
      #   Faker::Computer.linux_server_os #=> "RHEL 6.10"
      #
      # @faker.version next
      def linux_server_os
        fetch('computer.linux.server.os')
      end

      ##
      # Produces the name of a linux workstation os.
      #
      # @return [String]
      #
      # @example
      #   Faker::Computer.linux_workstation_os #=> "RHEL 6.10"
      #
      # @faker.version next
      def linux_workstation_os
        fetch('computer.linux.workstation.os')
      end

      ##
      # Produces the name of a osx server os.
      #
      # @return [String]
      #
      # @example
      #   Faker::Computer.osx_server_os #=> "Mojave (10.14)"
      #
      # @faker.version next
      def osx_server_os
        fetch('computer.osx.server.os')
      end

      ##
      # Produces the name of a osx workstation os.
      #
      # @return [String]
      #
      # @example
      #   Faker::Computer.osx_workstation_os #=> "Mojave (10.14)"
      #
      # @faker.version next
      def osx_workstation_os
        fetch('computer.osx.workstation.os')
      end

      ##
      # Produces the name of a windows server os.
      #
      # @return [String]
      #
      # @example
      #   Faker::Computer.windows_server_os #=> "Windows 10"
      #
      # @faker.version next
      def windows_server_os
        fetch('computer.windows.server.os')
      end

      ##
      # Produces the name of a windows workstation os.
      #
      # @return [String]
      #
      # @example
      #   Faker::Computer.windows_workstation_os #=> "Windows Server 2019"
      #
      # @faker.version next
      def windows_workstation_os
        fetch('computer.windows.workstation.os')
      end

      ##
      # Produces the a string with computer stack.
      #
      # @return [String]
      #
      # @example
      #   Faker::Computer.stack #=> "Linux, server, RHEL 6.10"
      #
      # @faker.version next
      def stack
        platform = fetch(computer.platform).downcase.delete(' ')
        type = fetch(computer.type)
        os = fetch("computer.#{platform}.#{type}.os")
        "#{platform}, #{type}, #{os}"
      end
    end
  end
end
