# frozen_string_literal: true

module Faker
  class JapaneseMedia
    class KamenRider < Base
      class << self
        ERAS = %i[showa heisei reiwa].freeze

        def eras=(new_eras)
          selected_eras = ERAS & new_eras
          @eras = selected_eras.empty? ? ERAS : selected_eras
        end

        ##
        # Produces the name of a Kamen Rider from a series in the given era.
        #
        # @return [String]
        #
        # @example
        #   Faker::JapaneseMedia::KamenRider.kamen_rider #=> "Kamen Rider Revice"
        #
        # @faker.version next
        def kamen_rider(*eras)
          from_eras(*eras, field: :kamen_riders)
        end

        ##
        # Produces the name of a main user of Kamen Rider.
        #
        # @return [String]
        #
        # @example
        #   Faker::JapaneseMedia::KamenRider.user #=> "Ikki Igarashi"
        #
        # @faker.version next
        def user(*eras)
          from_eras(*eras, field: :users)
        end

        ##
        # Produces the name of a Kamen Rider series.
        #
        # @return [String]
        #
        # @example
        #   Faker::JapaneseMedia::KamenRider.series #=> "Kamen Rider Revice"
        #
        # @faker.version next
        def series(*eras)
          from_eras(*eras, field: :series)
        end

        private

        def eras
          @eras ||= ERAS
        end

        def from_eras(*input_eras, field:)
          selected_eras = (ERAS & input_eras).yield_self do |selected|
            selected.empty? ? eras : selected
          end
          selected_eras.sample.yield_self do |era|
            fetch("kamen_rider.#{era}.#{field}")
          end
        end
      end
    end
  end
end
