# frozen_string_literal: true

module Faker
  module TvShows
    class TheITCrowd < Base
      flexible :the_it_crowd

      class << self
        def actor
          fetch('the_it_crowd.actors')
        end

        def character
          fetch('the_it_crowd.characters')
        end

        def email
          fetch('the_it_crowd.emails')
        end

        def quote
          fetch('the_it_crowd.quotes')
        end
      end
    end
  end
end
