# frozen_string_literal: true

module Faker
  class DrivingLicense < Base
    GB_PADDING = '9999'
    NI_CHANCE = 0.03 # NI Pop is about 3% of total UK population

    class << self
      # rubocop:disable Metrics/ParameterLists

      ##
      # Produces a random British driving license number.
      #
      # @param last_name [String] The last name of the driving license's owner.
      # @param initials [String] The initials of the driving license's owner.
      # @param gender [String] The gender of the driving license's owner.
      # @param date_of_birth [String] The date of birth of the driving license's owner.
      # @return [String]
      #
      # @example
      #   Faker::DrivingLicense.british_driving_license        #=> "MCDER712081VF7EK"
      #   Faker::DrivingLicense.british_driving_license(last_name: "O'Carroll",
      #                                                 initials: "J",
      #                                                 gender: :female,
      #                                                 date_of_birth: Date.parse("1986-10-24")) #=> "OCARR815246J91HT"
      #
      # @faker.version 1.9.2
      def british_driving_license(legacy_last_name = NOT_GIVEN, legacy_initials = NOT_GIVEN, legacy_gender = NOT_GIVEN, legacy_date_of_birth = NOT_GIVEN, last_name: Faker::Name.last_name, initials: Faker::Name.initials, gender: random_gender, date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65))
        warn_for_deprecated_arguments do |keywords|
          keywords << :last_name if legacy_last_name != NOT_GIVEN
          keywords << :initials if legacy_initials != NOT_GIVEN
          keywords << :gender if legacy_gender != NOT_GIVEN
          keywords << :date_of_birth if legacy_date_of_birth != NOT_GIVEN
        end

        [
          gb_license_padding(last_name, 5),
          gb_license_year(date_of_birth, gender),
          gb_license_padding(initials, 2),
          gb_license_checksum
        ].join
      end
      # rubocop:enable Metrics/ParameterLists

      ##
      # Produces a random Northern Irish license number.
      #
      # @return [String]
      #
      # @example
      #   Faker::DrivingLicense.northern_irish_driving_license #=> "70702548"
      #
      # @faker.version 1.9.2
      def northern_irish_driving_license
        Faker::Number.number(digits: 8).to_s
      end

      ##
      # Produces a random UK driving license number in either GB or NI format, at a rate consistent with their relative populations
      #
      # @overload uk_driving_license(last_name, initials, gender, date_of_birth)
      #   @param last_name [String] The last name of the driving license's owner.
      #   @param initials [String] The initials of the driving license's owner.
      #   @param gender [String] The gender of the driving license's owner.
      #   @param date_of_birth [String] The date of birth of the driving license's owner.
      # @overload uk_driving_license()
      # @return [String]
      #
      # @example
      #   Faker::DrivingLicense.uk_driving_license             #=> "OCARR815246J91HT"
      #   Faker::DrivingLicense.uk_driving_license             #=> "70702548"
      #
      # @faker.version 1.9.2
      def uk_driving_license(*args)
        if Faker::Config.random.rand < NI_CHANCE
          northern_irish_driving_license
        else
          british_driving_license(*args)
        end
      end

      ##
      # Produces a random USA driving license number by state code passed.
      #
      # @return [String]
      #
      # @example
      #   Faker::DrivingLicense.usa_driving_license                 #=> "V5598249"
      #   Faker::DrivingLicense.usa_driving_license('new mexico')   #=> "270692028"
      #   Faker::DrivingLicense.usa_driving_license('New Mexico')   #=> "68178637"
      #
      # @faker.version 2.14.0
      def usa_driving_license(state = 'California')
        bothify(fetch("driving_license.usa.#{state.to_s.strip.downcase.gsub(' ', '_')}"))
      rescue I18n::MissingTranslationData => _e
        raise InvalidStatePassed, "Invalid state code passed for USA, '#{state}'"
      end

      private

      def random_gender
        %i[male female].sample(random: Faker::Config.random)
      end

      def gb_license_padding(str, num_chars)
        prepped = str.upcase.gsub(%r{[^A-Z]}, '') + GB_PADDING
        prepped[0..(num_chars - 1)]
      end

      def gb_license_year(dob, gender)
        decade = (dob.year / 10) % 10
        year = dob.year % 10
        month = gender == :female ? dob.month + 50 : dob.month
        # Rubocop's preferred formatting is pretty gory
        # rubocop:disable Style/FormatString
        "#{decade}#{'%02d' % month}#{'%02d' % dob.day}#{year}"
        # rubocop:enable Style/FormatString
      end

      def gb_license_checksum
        regexify(/[0-9][A-Z][A-Z]/)
      end
    end
  end

  class InvalidStatePassed < StandardError
    def initialize(msg = 'Invalid state code passed')
      super
    end
  end
end
