# frozen_string_literal: true

module Faker
  class Music
    class Phish < Base
      class << self
        def song
          fetch('phish.song')
        end
      end
    end
  end
end
