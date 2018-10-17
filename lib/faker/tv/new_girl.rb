# frozen_string_literal: true

module Faker
  module TV
    class NewGirl < Base
      class << self
        def character
          fetch('new_girl.characters')
        end

        def quote
          fetch('new_girl.quotes')
        end
      end
    end
  end
end
