# frozen_string_literal: true

module Faker
  class InternationalPhoneticAlphabet < Base
    class << self
      MAX_LIMIT = 1000

      ##
      # Generates a random IPA consonant.
      #
      # @param [Integer] amount The maximum number of IPA consonants to generate.
      # @return [String] A random IPA consonant.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonants #=> "tʃ"
      #   Faker::InternationalPhoneticAlphabet.consonants(amount: 5) #=> "tʃʃtts"
      #
      # @faker.version next
      def consonant(amount: 1)
        generate_ipa_string(key: 'ipa.consonants', amount: amount)
      end

      ##
      # Generates a random IPA vowel.
      #
      # @param [Integer] amount The maximum number of IPA vowels to generate.
      # @return [String] A random IPA vowel.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.vowels #=> " ɤ"
      #   Faker::InternationalPhoneticAlphabet.vowels(amount: 5) #=> "ɤoɛœæ"
      #
      # @faker.version next
      def vowel(amount: 1)
        generate_ipa_string(key: 'ipa.vowels', amount: amount)
      end

      ##
      # Generates random IPA high front vowels.
      #
      # @param amount [Integer] The maximum number of IPA high front vowels to generate.
      # @return [String] A random IPA high front vowel string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.vowel_high_front #=> " i"
      #   Faker::InternationalPhoneticAlphabet.vowel_high_front(amount: 4) #=> "iyɪʏ"
      #
      # @faker.version next
      def vowel_high_front(amount: 1)
        generate_ipa_string(key: 'ipa.vowel.high.front', amount: amount)
      end

      ##
      # Generates random IPA high central vowels.
      #
      # @param amount [Integer] The maximum number of IPA high central vowels to generate.
      # @return [String] A random IPA high central vowel string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.vowel_high_central #=> " ɨ"
      #   Faker::InternationalPhoneticAlphabet.vowel_high_central(amount: 3) #=> "ɨʉʊ"
      #
      # @faker.version next
      def vowel_high_central(amount: 1)
        generate_ipa_string(key: 'ipa.vowel.high.central', amount: amount)
      end

      ##
      # Generates random IPA high back vowels.
      #
      # @param amount [Integer] The maximum number of IPA high back vowels to generate.
      # @return [String] A random IPA high back vowel string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.vowel_high_back #=> " ɯ"
      #   Faker::InternationalPhoneticAlphabet.vowel_high_back(amount: 2) #=> "ɯu"
      #
      # @faker.version next
      def vowel_high_back(amount: 1)
        generate_ipa_string(key: 'ipa.vowel.high.back', amount: amount)
      end

      ##
      # Generates random IPA mid-high front vowels.
      #
      # @param amount [Integer] The maximum number of IPA mid-high front vowels to generate.
      # @return [String] A random IPA mid-high front vowel string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.vowel_mid_high_front #=> "e"
      #   Faker::InternationalPhoneticAlphabet.vowel_mid_high_front(amount: 2) #=> "eø"
      #
      # @faker.version next
      def vowel_mid_high_front(amount: 1)
        generate_ipa_string(key: 'ipa.vowel.mid_high.front', amount: amount)
      end

      ##
      # Generates random IPA mid-high central vowels.
      #
      # @param amount [Integer] The maximum number of IPA mid-high central vowels to generate.
      # @return [String] A random IPA mid-high central vowel string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.vowel_mid_high_central #=> "ɨ"
      #   Faker::InternationalPhoneticAlphabet.vowel_mid_high_central(amount: 3) #=> "ɨʉʊ"
      #
      # @faker.version next
      def vowel_mid_high_central(amount: 1)
        generate_ipa_string(key: 'ipa.vowel.mid_high.central', amount: amount)
      end

      ##
      # Generates random IPA mid-high back vowels.
      #
      # @param amount [Integer] The maximum number of IPA mid-high back vowels to generate.
      # @return [String] A random IPA mid-high back vowel string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.vowel_mid_high_back #=> "ɤ"
      #   Faker::InternationalPhoneticAlphabet.vowel_mid_high_back(amount: 2) #=> "ɤo"
      #
      # @faker.version next
      def vowel_mid_high_back(amount: 1)
        generate_ipa_string(key: 'ipa.vowel.mid_high.back', amount: amount)
      end

      ##
      # Generates random IPA mid-low front vowels.
      #
      # @param amount [Integer] The maximum number of IPA mid-low front vowels to generate.
      # @return [String] A random IPA mid-low front vowel string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.vowel_mid_low_front #=> "ɛ"
      #   Faker::InternationalPhoneticAlphabet.vowel_mid_low_front(amount: 3) #=> "ɛœæ"
      #
      # @faker.version next
      def vowel_mid_low_front(amount: 1)
        generate_ipa_string(key: 'ipa.vowel.mid_low.front', amount: amount)
      end

      ##
      # Generates random IPA mid-low central vowels.
      #
      # @param amount [Integer] The maximum number of IPA mid-low central vowels to generate.
      # @return [String] A random IPA mid-low central vowel string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.vowel_mid_low_central #=> "ɞ"
      #   Faker::InternationalPhoneticAlphabet.vowel_mid_low_central(amount: 3) #=> "ɜɞɐ"
      #
      # @faker.version next
      def vowel_mid_low_central(amount: 1)
        generate_ipa_string(key: 'ipa.vowel.mid_low.central', amount: amount)
      end

      ##
      # Generates random IPA mid-low back vowels.
      #
      # @param amount [Integer] The maximum number of IPA mid-low back vowels to generate.
      # @return [String] A random IPA mid-low back vowel string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.vowel_mid_low_back #=> "ʌ"
      #   Faker::InternationalPhoneticAlphabet.vowel_mid_low_back(amount: 2) #=> "ʌɔ"
      #
      # @faker.version next
      def vowel_mid_low_back(amount: 1)
        generate_ipa_string(key: 'ipa.vowel.mid_low.back', amount: amount)
      end

      ##
      # Generates random IPA low front vowels.
      #
      # @param amount [Integer] The maximum number of IPA low front vowels to generate.
      # @return [String] A random IPA low front vowel string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.vowel_low_front #=> "a"
      #   Faker::InternationalPhoneticAlphabet.vowel_low_front(amount: 3) #=> "aɶæ"
      #
      # @faker.version next
      def vowel_low_front(amount: 1)
        generate_ipa_string(key: 'ipa.vowel.low.front', amount: amount)
      end

      ##
      # Generates random IPA low back vowels.
      #
      # @param amount [Integer] The maximum number of IPA low back vowels to generate.
      # @return [String] A random IPA low back vowel string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.vowel_low_back #=> "ɑ"
      #   Faker::InternationalPhoneticAlphabet.vowel_low_back(amount: 2) #=> "ɑɒ"
      #
      # @faker.version next
      def vowel_low_back(amount: 1)
        generate_ipa_string(key: 'ipa.vowel.low.back', amount: amount)
      end

      ##
      # Generates random IPA bilabial oral consonants.
      #
      # @param amount [Integer] The maximum number of IPA bilabial oral consonants to generate.
      # @return [String] A random IPA bilabial oral consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_bilabial_oral #=> "p"
      #   Faker::InternationalPhoneticAlphabet.consonant_bilabial_oral(amount: 2) #=> "pb"
      #
      # @faker.version next
      def consonant_bilabial_oral(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.bilabial.oral', amount: amount)
      end

      ##
      # Generates random IPA bilabial nasal consonants.
      #
      # @param amount [Integer] The maximum number of IPA bilabial nasal consonants to generate.
      # @return [String] A random IPA bilabial nasal consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_bilabial_nasal #=> "m"
      #   Faker::InternationalPhoneticAlphabet.consonant_bilabial_nasal(amount: 4) #=> "mmmm"
      #
      # @faker.version next
      def consonant_bilabial_nasal(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.bilabial.nasal', amount: amount)
      end

      ##
      # Generates random IPA bilabial trill consonants.
      #
      # @param amount [Integer] The maximum number of IPA bilabial trill consonants to generate.
      # @return [String] A random IPA bilabial trill consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_bilabial_trill #=> "ʙ"
      #   Faker::InternationalPhoneticAlphabet.consonant_bilabial_trill(amount: 4) #=> "ʙʙʙʙ"
      #
      # @faker.version next
      def consonant_bilabial_trill(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.bilabial.trill', amount: amount)
      end

      ##
      # Generates random IPA bilabial fricative consonants.
      #
      # @param amount [Integer] The maximum number of IPA bilabial fricative consonants to generate.
      # @return [String] A random IPA bilabial fricative consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_bilabial_fricative #=> " β"
      #   Faker::InternationalPhoneticAlphabet.consonant_bilabial_fricative(amount: 3) #=> "βɸɸ"
      #
      # @faker.version next
      def consonant_bilabial_fricative(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.bilabial.fricative', amount: amount)
      end

      ##
      # Generates random IPA bilabial approximant consonants.
      #
      # @param amount [Integer] The maximum number of IPA bilabial approximant consonants to generate.
      # @return [String] A random IPA bilabial approximant consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_bilabial_approximant #=> "ɸ"
      #   Faker::InternationalPhoneticAlphabet.consonant_bilabial_approximant(amount: 2) #=> "ɸβ"
      #
      # @faker.version next
      def consonant_bilabial_approximant(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.bilabial.approximant', amount: amount)
      end

      ##
      # Generates random IPA labiodental nasal consonants.
      #
      # @param amount [Integer] The maximum number of IPA labiodental nasal consonants to generate.
      # @return [String] A random IPA labiodental nasal consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_labiodental_nasal #=> "ɱ"
      #   Faker::InternationalPhoneticAlphabet.consonant_labiodental_nasal(amount: 4) #=> "ɱɱɱɱ"
      #
      # @faker.version next
      def consonant_labiodental_nasal(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.labiodental.nasal', amount: amount)
      end

      ##
      # Generates random IPA labiodental fricative consonants.
      #
      # @param amount [Integer] The maximum number of IPA labiodental fricative consonants to generate.
      # @return [String] A random IPA labiodental fricative consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_labiodental_fricative #=> "v"
      #   Faker::InternationalPhoneticAlphabet.consonant_labiodental_fricative(amount: 4) #=> "vvvv"
      #
      # @faker.version next
      def consonant_labiodental_fricative(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.labiodental.fricative', amount: amount)
      end

      ##
      # Generates random IPA dental fricative consonants.
      #
      # @param amount [Integer] The maximum number of IPA dental fricative consonants to generate.
      # @return [String] A random IPA dental fricative consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_dental_fricative #=> " θ"
      #   Faker::InternationalPhoneticAlphabet.consonant_dental_fricative(amount: 2) #=> "θð"
      #
      # @faker.version next
      def consonant_dental_fricative(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.dental.fricative', amount: amount)
      end

      ##
      # Generates random IPA alveolar oral consonants.
      #
      # @param amount [Integer] The maximum number of IPA alveolar oral consonants to generate.
      # @return [String] A random IPA alveolar oral consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_alveolar_oral #=> "t"
      #   Faker::InternationalPhoneticAlphabet.consonant_alveolar_oral(amount: 4) #=> "tddt"
      #
      # @faker.version next
      def consonant_alveolar_oral(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.alveolar.oral', amount: amount)
      end

      ##
      # Generates random IPA alveolar nasal consonants.
      #
      # @param amount [Integer] The maximum number of IPA alveolar nasal consonants to generate.
      # @return [String] A random IPA alveolar nasal consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_alveolar_nasal #=> "n"
      #   Faker::InternationalPhoneticAlphabet.consonant_alveolar_nasal(amount: 3) #=> "nnn"
      #
      # @faker.version next
      def consonant_alveolar_nasal(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.alveolar.nasal', amount: amount)
      end

      ##
      # Generates random IPA alveolar trill consonants.
      #
      # @param amount [Integer] The maximum number of IPA alveolar trill consonants to generate.
      # @return [String] A random IPA alveolar trill consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_alveolar_trill #=> "r"
      #   Faker::InternationalPhoneticAlphabet.consonant_alveolar_trill(amount: 2) #=> "rr"
      #
      # @faker.version next
      def consonant_alveolar_trill(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.alveolar.trill', amount: amount)
      end

      ##
      # Generates random IPA alveolar tap or flap consonants.
      #
      # @param amount [Integer] The maximum number of IPA alveolar tap or flap consonants to generate.
      # @return [String] A random IPA alveolar tap or flap consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_alveolar_tap_or_flap #=> "ɾ"
      #   Faker::InternationalPhoneticAlphabet.consonant_alveolar_tap_or_flap(amount: 3) #=> "ɾɾɾ"
      #
      # @faker.version next
      def consonant_alveolar_tap_or_flap(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.alveolar.tap_or_flap', amount: amount)
      end

      ##
      # Generates random IPA alveolar fricative consonants.
      #
      # @param amount [Integer] The maximum number of IPA alveolar fricative consonants to generate.
      # @return [String] A random IPA alveolar fricative consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_alveolar_fricative #=> " s"
      #   Faker::InternationalPhoneticAlphabet.consonant_alveolar_fricative(amount: 3) #=> "szz"
      #
      # @faker.version next
      def consonant_alveolar_fricative(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.alveolar.fricative', amount: amount)
      end

      ##
      # Generates random IPA alveolar lateral fricative consonants.
      #
      # @param amount [Integer] The maximum number of IPA alveolar lateral fricative consonants to generate.
      # @return [String] A random IPA alveolar lateral fricative consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_alveolar_lateral_fricative #=> "ɬ"
      #   Faker::InternationalPhoneticAlphabet.consonant_alveolar_lateral_fricative(amount: 4) #=> "ɬɬɮɬ"
      #
      # @faker.version next
      def consonant_alveolar_lateral_fricative(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.alveolar.lateral_fricative', amount: amount)
      end

      ##
      # Generates random IPA alveolar approximant consonants.
      #
      # @param amount [Integer] The maximum number of IPA alveolar approximant consonants to generate.
      # @return [String] A random IPA alveolar approximant consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_alveolar_approximant #=> "ɹ"
      #   Faker::InternationalPhoneticAlphabet.consonant_alveolar_approximant(amount: 4) #=> "ɹɹɹɹɹ"
      #
      # @faker.version next
      def consonant_alveolar_approximant(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.alveolar.approximant', amount: amount)
      end

      ##
      # Generates random IPA alveolar lateral approximant consonants.
      #
      # @param amount [Integer] The maximum number of IPA alveolar lateral approximant consonants to generate.
      # @return [String] A random IPA alveolar lateral approximant consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_alveolar_lateral_approximant #=> "l"
      #   Faker::InternationalPhoneticAlphabet.consonant_alveolar_lateral_approximant(amount: 4) #=> "llll"
      #
      # @faker.version next
      def consonant_alveolar_lateral_approximant(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.alveolar.lateral_approximant', amount: amount)
      end

      ##
      # Generates random IPA postalveolar affricate consonants.
      #
      # @param amount [Integer] The maximum number of IPA postalveolar affricate consonants to generate.
      # @return [String] A random IPA postalveolar affricate consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_postalveolar_affricate #=> "tʃ"
      #   Faker::InternationalPhoneticAlphabet.consonant_postalveolar_affricate(amount: 4) #=> "dʒtʃdʒtʃ"
      #
      # @faker.version next
      def consonant_postalveolar_affricate(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.postalveolar.affricate', amount: amount)
      end

      ##
      # Generates random IPA postalveolar fricative consonants.
      #
      # @param amount [Integer] The maximum number of IPA postalveolar fricative consonants to generate.
      # @return [String] A random IPA postalveolar fricative consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_postalveolar_fricative #=> "ʒ"
      #   Faker::InternationalPhoneticAlphabet.consonant_postalveolar_fricative(amount: 3) #=> "ʃʒʒ"
      #
      # @faker.version next
      def consonant_postalveolar_fricative(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.postalveolar.fricative', amount: amount)
      end

      ##
      # Generates random IPA retroflex oral consonants.
      #
      # @param amount [Integer] The maximum number of IPA retroflex oral consonants to generate.
      # @return [String] A random IPA retroflex oral consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_retroflex_oral #=> "ʈ"
      #   Faker::InternationalPhoneticAlphabet.consonant_retroflex_oral(amount: 2) #=> "ʈɖ"
      #
      # @faker.version next
      def consonant_retroflex_oral(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.retroflex.oral', amount: amount)
      end

      ##
      # Generates random IPA retroflex nasal consonants.
      #
      # @param amount [Integer] The maximum number of IPA retroflex nasal consonants to generate.
      # @return [String] A random IPA retroflex nasal consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_retroflex_nasal #=> "ɳ"
      #   Faker::InternationalPhoneticAlphabet.consonant_retroflex_nasal(amount: 3) #=> "ɳɳɳ"
      #
      # @faker.version next
      def consonant_retroflex_nasal(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.retroflex.oral', amount: amount)
      end

      ##
      # Generates random IPA retroflex tap or flap consonants.
      #
      # @param amount [Integer] The maximum number of IPA retroflex tap or flap consonants to generate.
      # @return [String] A random IPA retroflex tap or flap consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_retroflex_tap_or_flap #=> "ɽ"
      #   Faker::InternationalPhoneticAlphabet.consonant_retroflex_tap_or_flap(amount: 3) #=> "ɽɽɽ"
      #
      # @faker.version next
      def consonant_retroflex_tap_or_flap(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.retroflex.tap_or_flap', amount: amount)
      end

      ##
      # Generates random IPA retroflex fricative consonants.
      #
      # @param amount [Integer] The maximum number of IPA retroflex fricative consonants to generate.
      # @return [String] A random IPA retroflex fricative consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_retroflex_fricative #=> "ʂ"
      #   Faker::InternationalPhoneticAlphabet.consonant_retroflex_fricative(amount: 2) #=> "ʂʐ"
      #
      # @faker.version next
      def consonant_retroflex_fricative(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.retroflex.fricative', amount: amount)
      end

      ##
      # Generates random IPA retroflex lateral approximant consonants.
      #
      # @param amount [Integer] The maximum number of IPA retroflex lateral approximant consonants to generate.
      # @return [String] A random IPA retroflex lateral approximant consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_retroflex_approximant #=> "ɻ"
      #   Faker::InternationalPhoneticAlphabet.consonant_retroflex_approximant(amount: 3) #=> "ɻɻɻ"
      #
      # @faker.version next
      def consonant_retroflex_approximant(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.retroflex.lateral_approximant', amount: amount)
      end

      ##
      # Generates random IPA retroflex lateral approximant consonants.
      #
      # @param amount [Integer] The maximum number of IPA retroflex lateral approximant consonants to generate.
      # @return [String] A random IPA retroflex lateral approximant consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_retroflex_lateral_approximant #=> "ɭ"
      #   Faker::InternationalPhoneticAlphabet.consonant_retroflex_lateral_approximant(amount: 3) #=> "ɭɭɭ"
      #
      # @faker.version next
      def consonant_retroflex_lateral_approximant(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.retroflex.lateral_approximant', amount: amount)
      end

      ##
      # Generates random IPA palatal oral consonants.
      #
      # @param amount [Integer] The maximum number of IPA palatal oral consonants to generate.
      # @return [String] A random IPA palatal oral consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_palatal_oral #=> "c"
      #   Faker::InternationalPhoneticAlphabet.consonant_palatal_oral(amount: 4) #=> "cɟcɟ"
      #
      # @faker.version next
      def consonant_palatal_oral(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.palatal.oral', amount: amount)
      end

      ##
      # Generates random IPA palatal nasal consonants.
      #
      # @param amount [Integer] The maximum number of IPA palatal nasal consonants to generate.
      # @return [String] A random IPA palatal nasal consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_palatal_nasal #=> "ɲ"
      #   Faker::InternationalPhoneticAlphabet.consonant_palatal_nasal(amount: 3) #=> "ɲɲɲ"
      #
      # @faker.version next
      def consonant_palatal_nasal(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.palatal.nasal', amount: amount)
      end

      ##
      # Generates random IPA palatal fricative consonants.
      #
      # @param amount [Integer] The maximum number of IPA palatal fricative consonants to generate.
      # @return [String] A random IPA palatal fricative consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_palatal_fricative #=> "ç"
      #   Faker::InternationalPhoneticAlphabet.consonant_palatal_fricative(amount: 3) #=> "çʝʝ"
      #
      # @faker.version next
      def consonant_palatal_fricative(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.palatal.fricative', amount: amount)
      end

      ##
      # Generates random IPA palatal approximant consonants.
      #
      # @param amount [Integer] The maximum number of IPA palatal approximant consonants to generate.
      # @return [String] A random IPA palatal approximant consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_palatal_approximant #=> "j"
      #   Faker::InternationalPhoneticAlphabet.consonant_palatal_approximant(amount: 2) #=> "jj"
      #
      # @faker.version next
      def consonant_palatal_approximant(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.palatal.fricative', amount: amount)
      end

      ##
      # Generates random IPA palatal lateral approximant consonants.
      #
      # @param amount [Integer] The maximum number of IPA palatal lateral approximant consonants to generate.
      # @return [String] A random IPA palatal lateral approximant consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_palatal_lateral_approximant #=> "ʎ"
      #   Faker::InternationalPhoneticAlphabet.consonant_palatal_lateral_approximant(amount: 2) #=> "ʎʎ"
      #
      # @faker.version next
      def consonant_palatal_lateral_approximant(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.palatal.approximant', amount: amount)
      end

      ##
      # Generates random IPA velar oral consonants.
      #
      # @param amount [Integer] The maximum number of IPA velar oral consonants to generate.
      # @return [String] A random IPA velar oral consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_velar_oral #=> "k"
      #   Faker::InternationalPhoneticAlphabet.consonant_velar_oral(amount: 2) #=> "kg"
      #
      # @faker.version next
      def consonant_velar_oral(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.velar.oral', amount: amount)
      end

      ##
      # Generates random IPA velar nasal consonants.
      #
      # @param amount [Integer] The maximum number of IPA velar nasal consonants to generate.
      # @return [String] A random IPA velar nasal consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_velar_nasal #=> "ŋ"
      #   Faker::InternationalPhoneticAlphabet.consonant_velar_nasal(amount: 2) #=> "ŋŋ"
      #
      # @faker.version next
      def consonant_velar_nasal(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.velar.nasal', amount: amount)
      end

      ##
      # Generates random IPA velar fricative consonants.
      #
      # @param amount [Integer] The maximum number of IPA velar fricative consonants to generate.
      # @return [String] A random IPA velar fricative consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_velar_fricative #=> "x"
      #   Faker::InternationalPhoneticAlphabet.consonant_velar_fricative(amount: 2) #=> "xɣ"
      #
      # @faker.version next
      def consonant_velar_fricative(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.velar.fricative', amount: amount)
      end

      ##
      # Generates random IPA velar approximant consonants.
      #
      # @param amount [Integer] The maximum number of IPA velar approximant consonants to generate.
      # @return [String] A random IPA velar approximant consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_velar_approximant #=> "ɰ"
      #   Faker::InternationalPhoneticAlphabet.consonant_velar_approximant(amount: 2) #=> "ɰw"
      #
      # @faker.version next
      def consonant_velar_approximant(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.velar.approximant', amount: amount)
      end

      ##
      # Generates random IPA velar lateral approximant consonants.
      #
      # @param amount [Integer] The maximum number of IPA velar lateral approximant consonants to generate.
      # @return [String] A random IPA velar lateral approximant consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_velar_lateral_approximant #=> "ʟ"
      #   Faker::InternationalPhoneticAlphabet.consonant_velar_lateral_approximant(amount: 2) #=> "ʟʟ"
      #
      # @faker.version next
      def consonant_velar_lateral_approximant(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.velar.lateral_approximant', amount: amount)
      end

      ##
      # Generates random IPA uvular oral consonants.
      #
      # @param amount [Integer] The maximum number of IPA uvular oral consonants to generate.
      # @return [String] A random IPA uvular oral consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_uvular_oral #=> "q"
      #   Faker::InternationalPhoneticAlphabet.consonant_uvular_oral(amount: 2) #=> "qɢ"
      #
      # @faker.version next
      def consonant_uvular_oral(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.uvular.oral', amount: amount)
      end

      ##
      # Generates random IPA uvular nasal consonants.
      #
      # @param amount [Integer] The maximum number of IPA uvular nasal consonants to generate.
      # @return [String] A random IPA uvular nasal consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_uvular_nasal #=> "ɴ"
      #   Faker::InternationalPhoneticAlphabet.consonant_uvular_nasal(amount: 2) #=> "ɴɴ"
      #
      # @faker.version next
      def consonant_uvular_nasal(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.uvular.nasal', amount: amount)
      end

      ##
      # Generates random IPA uvular trill consonants.
      #
      # @param amount [Integer] The maximum number of IPA uvular trill consonants to generate.
      # @return [String] A random IPA uvular trill consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_uvular_trill #=> "ʀ"
      #   Faker::InternationalPhoneticAlphabet.consonant_uvular_trill(amount: 2) #=> "ʀʀ"
      #
      # @faker.version next
      def consonant_uvular_trill(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.uvular.trill', amount: amount)
      end

      ##
      # Generates random IPA uvular fricative consonants.
      #
      # @param amount [Integer] The maximum number of IPA uvular fricative consonants to generate.
      # @return [String] A random IPA uvular fricative consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_uvular_fricative #=> "χʁ"
      #   Faker::InternationalPhoneticAlphabet.consonant_uvular_fricative(amount: 2) #=> "χʁ"
      #
      # @faker.version next
      def consonant_uvular_fricative(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.uvular.fricative', amount: amount)
      end

      ##
      # Generates random IPA pharyngeal fricative consonants.
      #
      # @param amount [Integer] The maximum number of IPA pharyngeal fricative consonants to generate.
      # @return [String] A random IPA pharyngeal fricative consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_pharyngeal_fricative #=> "ħ"
      #   Faker::InternationalPhoneticAlphabet.consonant_pharyngeal_fricative(amount: 3) #=> "ħʕʕ"
      #
      # @faker.version next
      def consonant_pharyngeal_fricative(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.pharyngeal.fricative', amount: amount)
      end

      ##
      # Generates random IPA global oral consonants.
      #
      # @param amount [Integer] The maximum number of IPA global oral consonants to generate.
      # @return [String] A random IPA global oral consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_global_oral #=> "ʔ"
      #   Faker::InternationalPhoneticAlphabet.consonant_global_oral(amount: 3) #=> "ʔʔʔ"
      #
      # @faker.version next
      def consonant_global_oral(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.global.oral', amount: amount)
      end

      ##
      # Generates random IPA global fricative consonants.
      #
      # @param amount [Integer] The maximum number of IPA global fricative consonants to generate.
      # @return [String] A random IPA global fricative consonant string.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant_global_fricative #=> "h"
      #   Faker::InternationalPhoneticAlphabet.consonant_global_fricative(amount: 3) #=> "hhɦ"
      #
      # @faker.version next
      def consonant_global_fricative(amount: 1)
        generate_ipa_string(key: 'ipa.consonant.global.fricative', amount: amount)
      end

      private

      ##
      # Generates a random IPA string based on the provided key and amount.
      #
      # @param key [String] The key for the IPA string to generate.
      # @param amount [Integer] The maximum number of IPA characters to generate.
      # @return [String] A random IPA string.
      #
      # @param [ArgumentError] If the amount exceeds the maximum limit.
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.generate_ipa_string(key: 'ipa.vowel.high.front', amount: 3) #=> "iːi"
      #   Faker::InternationalPhoneticAlphabet.generate_ipa_string(key: 'ipa.consonant.bilabial.oral', amount: 2) #=> "pb"
      #
      # @faker.version next
      def generate_ipa_string(key:, amount:)
        check_amount_limit(amount)

        (0...amount).map { fetch(key) }.join
      end

      ##
      # Checks if the provided amount is within the valid range.
      #
      # This method raises an ArgumentError if the amount is less than or equal to zero
      # or exceeds the maximum limit defined by `MAX_LIMIT`.
      #
      # @param amount [Integer] The amount to be checked.
      # @raise [ArgumentError] If the amount is less than or equal to zero or exceeds the maximum limit (MAX_LIMIT).
      #
      # @example
      #   check_amount_limit(3) # No exception is raised.
      #   check_amount_limit(0) # Raises ArgumentError: "Amount must be greater than 0".
      #   check_amount_limit(42) # Raises ArgumentError: "Amount must be less than or equal to #{MAX_LIMIT}".
      def check_amount_limit(amount)
        if amount <= 0
          raise ArgumentError, 'Amount must be greater than 0'
        elsif amount > MAX_LIMIT
          raise ArgumentError, "Amount must be less than or equal to #{MAX_LIMIT}"
        end
      end
    end
  end
end
