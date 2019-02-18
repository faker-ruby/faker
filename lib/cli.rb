# frozen_string_literal: true

require 'thor'

require 'cli/commands/list'
require 'cli/commands/search'
require 'faker/version'

module Faker
  module CLI
    class Base < Thor
      Error = Class.new(StandardError)
      # Skip default deprecation warning output; the CLI will display that.
      Gem::Deprecate.skip_during do
        desc 'version', 'Faker version'
        def version
          puts "v#{Faker::VERSION}"
        end
        map %w[--version -v] => :version

        desc 'list', 'List all Faker constants'
        method_option :help, aliases: '-h', type: :boolean,
                             desc: 'Display usage information'
        method_option :show_methods, aliases: '-m', type: :boolean, default: true,
                                     desc: 'Display Faker constants with methods'
        method_option :verbose, aliases: '-v', type: :boolean,
                                desc: 'Include sample Faker output'
        def list(*)
          if options[:help]
            invoke :help, ['list']
          else
            Faker::CLI::Commands::List.new(options).execute
          end
        end

        desc 'search [Faker]', 'Search Faker method(s)'
        method_option :help, aliases: '-h', type: :boolean,
                             desc: 'Display usage information'
        method_option :show_methods, aliases: '-m', type: :boolean, default: true,
                                     desc: 'Display Faker constants with methods'
        method_option :verbose, aliases: '-v', type: :boolean,
                                desc: 'Include sample Faker output'
        def search(query)
          if options[:help]
            invoke :help, ['search']
          else
            Faker::CLI::Commands::Search.new(options).execute(query)
          end
        end
      end
    end
  end
end
