# frozen_string_literal: true

module Faker
  class TvShows
    class DrWho < Base
      flexible :dr_who

      class << self
        def character
          fetch('dr_who.character')
        end

        def the_doctor
          fetch('dr_who.the_doctors')
        end

        def actor
          fetch('dr_who.actors')
        end

        def catch_phrase
          fetch('dr_who.catch_phrases')
        end

        def quote
          fetch('dr_who.quotes')
        end

        def villian
          fetch('dr_who.villians')
        end

        def specie
          fetch('dr_who.species')
        end
      end
    end
  end
end
