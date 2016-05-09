module Faker
  class Company < Base
    flexible :company

    class << self
      def name
        parse('company.name')
      end

      def suffix
        fetch('company.suffix')
      end

      def industry
        fetch('company.industry')
      end

      # Generate a buzzword-laden catch phrase.
      def catch_phrase
        translate('faker.company.buzzwords').collect {|list| list.sample }.join(' ')
      end

      def buzzword
        translate('faker.company.buzzwords').flatten.sample
      end

      # When a straight answer won't do, BS to the rescue!
      def bs
        translate('faker.company.bs').collect {|list| list.sample }.join(' ')
      end

      def ein
        ('%09d' % rand(10 ** 9)).gsub(/(\d\d)(\d\d\d\d\d\d\d)/, '\\1-\\2')
      end

      def duns_number
        ('%09d' % rand(10 ** 9)).gsub(/(\d\d)(\d\d\d)(\d\d\d\d)/, '\\1-\\2-\\3')
      end

      # Get a random company logo url in PNG format.
      def logo
        rand_num = Random.rand(13) + 1
        "https://pigment.github.io/fake-logos/logos/medium/color/#{rand_num}.png"
      end

      def swedish_organisation_number
        base = ('%09d' % rand(10 ** 9))
        base + luhn_algorithm(base).to_s
      end

      def profession
        fetch('company.profession')
      end

    private

      def luhn_algorithm(number)
        multiplications = []

        number.split(//).each_with_index do |digit, i|
          if i % 2 == 0
              multiplications << digit.to_i * 2
            else
              multiplications << digit.to_i
          end
        end

        sum = 0

        multiplications.each do |num|
          num.to_s.each_byte do |character|
            sum += character.chr.to_i
          end
        end

        if sum % 10 == 0
          control_digit = 0
        else
          control_digit = (sum / 10 + 1) * 10 - sum
        end

        control_digit
      end
    end
  end
end
