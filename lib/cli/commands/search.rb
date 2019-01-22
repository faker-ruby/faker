# frozen_string_literal: true

require_relative '../command'
require_relative '../reflectors/search'

module Faker
  module CLI
    module Commands
      class Search < Command
        def execute(input, output: $stdout)
          result = Reflectors::Search.call(input)
          render(result, output)
        end

        private

        def render(result, output)
          return not_found(output) if result.empty?

          super(result, output)
        end

        def not_found(output)
          output.puts "\nSorry, we couldn't find a match 😢", "\n"
        end
      end
    end
  end
end
