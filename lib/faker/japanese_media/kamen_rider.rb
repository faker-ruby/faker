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
        # @faker.version 1.8.0
        def kamen_rider(*eras)
          series_from_eras(*eras)[:riders].sample[:kamen_rider]
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
          series_from_eras(*eras)[:riders].sample[:user]
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
          series_from_eras(*eras)[:name]
        end

        private

        def eras
          @eras ||= ERAS
        end

        def series_from_eras(*input_eras)
          selected_eras = (eras & input_eras).yield_self do |selected|
            selected.empty? ? eras : selected
          end
          selected_eras.map do |era|
            fetch_all("kamen_rider.#{era}")
          end.flatten.sample
        end
      end
    end
  end
end
