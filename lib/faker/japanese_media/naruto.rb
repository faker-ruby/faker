# frozen_string_literal: true

module Faker
  module JapaneseMedia
    class Naruto < Base
      class << self
        def character
          fetch('naruto.characters')
        end
      end
    end
  end
end
