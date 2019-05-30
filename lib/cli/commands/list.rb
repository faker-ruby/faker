# frozen_string_literal: true

require_relative '../command'
require_relative '../reflectors/list'

module Faker
  module CLI
    module Commands
      class List < Command
        def execute(output: $stdout)
          result = Reflectors::List.call(options)
          render(result, output)
        end
      end
    end
  end
end
