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
        translate('faker.company.buzzwords').collect {|list| sample(list) }.join(' ')
      end

      def buzzword
        sample(translate('faker.company.buzzwords').flatten)
      end

      # When a straight answer won't do, BS to the rescue!
      def bs
        translate('faker.company.bs').collect {|list| sample(list) }.join(' ')
      end

      def ein
        ('%09d' % rand(10 ** 9)).gsub(/(\d{2})(\d{7})/, '\\1-\\2')
      end

      def duns_number
        ('%09d' % rand(10 ** 9)).gsub(/(\d{2})(\d{3})(\d{4})/, '\\1-\\2-\\3')
      end

      # Get a random company logo url in PNG format.
      def logo
        rand_num = rand(13) + 1
        "https://pigment.github.io/fake-logos/logos/medium/color/#{rand_num}.png"
      end

      # Get a random Swedish organization number. See more here https://sv.wikipedia.org/wiki/Organisationsnummer
      def swedish_organisation_number
        # Valid leading digit: 1, 2, 3, 5, 6, 7, 8, 9
        # Valid third digit: >= 2
        # Last digit is a control digit
        base = [sample([1, 2, 3, 5, 6, 7, 8, 9]), sample((0..9).to_a), sample((2..9).to_a), ('%06d' % rand(10 ** 6))].join
        base + luhn_algorithm(base).to_s
      end

      # Get a random Norwegian organization number. Info: https://www.brreg.no/om-oss/samfunnsoppdraget-vart/registera-vare/einingsregisteret/organisasjonsnummeret/
      def norwegian_organisation_number
        # Valid leading digit: 8, 9
        mod11_check = nil
        while mod11_check.nil?
          base = [sample([8, 9]), ('%07d' % rand(10 ** 7))].join
          mod11_check = mod11(base)
        end
        base + mod11_check.to_s
      end

      def australian_business_number
        base = ('%09d' % rand(10 ** 9))
        abn = "00#{base}"

        (99 - (abn_checksum(abn) % 89)).to_s + base
      end

      def profession
        fetch('company.profession')
      end

    private

      # Mod11 functionality from https://github.com/badmanski/mod11/blob/master/lib/mod11.rb
      def mod11(number)
        weight = [2, 3, 4, 5, 6, 7,
                  2, 3, 4, 5, 6, 7,
                  2, 3, 4, 5, 6, 7]

        sum = 0

        number.to_s.reverse.chars.each_with_index do |char, i|
          sum += char.to_i * weight[i]
        end

        remainder = sum % 11

        case remainder
        when 0 then remainder
        when 1 then nil
        else 11 - remainder
        end
      end

      def luhn_algorithm(number)
        multiplications = []

        number.split(//).each_with_index do |digit, i|
          if i.even?
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

      def abn_checksum(abn)
        abn_weights = [10,1,3,5,7,9,11,13,15,17,19]
        sum = 0

        abn_weights.each_with_index do |weight, i|
          sum += weight * abn[i].to_i
        end

        sum
      end

    end
  end
end
