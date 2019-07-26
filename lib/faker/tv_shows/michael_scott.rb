# frozen_string_literal: true

module Faker
  class TvShows
    class MichaelScott < Base
      class << self
        def quote
          fetch('michael_scott.quotes')
        end
      end
    end
  end
end
