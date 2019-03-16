# frozen_string_literal: true

module Faker
  module TvShows
    class ThirtyRock < Base
      flexible :thirty_rock

      class << self
        def character
          fetch('thirty_rock.characters')
        end

        def business_advice
          fetch('thirty_rock.business_advice')
        end

        def project
          fetch('thirty_rock.projects')
        end

        def quote
          fetch('thirty_rock.quotes')
        end
      end
    end
  end
end
