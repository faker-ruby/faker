# frozen_string_literal: true

module Faker
  class UmphreysMcgee
    class << self
      extend Gem::Deprecate

      def song
        Faker::Music::UmphreysMcgee.song
      end

      deprecate :song, 'Faker::Music::UmphreysMcgee.song', 2019, 01
    end
  end
end
