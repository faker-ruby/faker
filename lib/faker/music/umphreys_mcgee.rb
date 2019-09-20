# frozen_string_literal: true

module Faker
  class Music
    class UmphreysMcgee < Base
      class << self
        def song
          fetch('umphreys_mcgee.song')
        end
      end
    end
  end
end
