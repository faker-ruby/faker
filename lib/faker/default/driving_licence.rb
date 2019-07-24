# frozen_string_literal: true

module Faker
  class DrivingLicence < Base
    GB_PADDING = '9999'
    NI_CHANCE = 0.03 # NI Pop is about 3% of total UK population

    class << self
      def british_driving_licence(last_name: Faker::Name.last_name,
                                  initials: Faker::Name.initials,
                                  gender: random_gender,
                                  date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65))
        [
          gb_licence_padding(last_name, 5),
          gb_licence_year(date_of_birth, gender),
          gb_licence_padding(initials, 2),
          gb_licence_checksum
        ].join
      end

      def northern_irish_driving_licence
        Faker::Number.number(digits: 8).to_s
      end

      def uk_driving_licence(*args)
        if Faker::Config.random.rand < NI_CHANCE
          northern_irish_driving_licence
        else
          british_driving_licence(*args)
        end
      end

      private

      def random_gender
        %i[male female].sample(random: Faker::Config.random)
      end

      def gb_licence_padding(str, num_chars)
        prepped = str.upcase.gsub(%r{[^A-Z]}, '') + GB_PADDING
        prepped[0..(num_chars - 1)]
      end

      def gb_licence_year(dob, gender)
        decade = (dob.year / 10) % 10
        year = dob.year % 10
        month = gender == :female ? dob.month + 50 : dob.month
        # Rubocop's preferred formatting is pretty gory
        # rubocop:disable FormatString
        "#{decade}#{'%02d' % month}#{'%02d' % dob.day}#{year}"
        # rubocop:enable FormatString
      end

      def gb_licence_checksum
        regexify(/[0-9][A-Z][A-Z]/)
      end
    end
  end
end
