# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerInternationalPhoneticAlphabet < Test::Unit::TestCase
  def setup
    @faker_ipa = Faker::InternationalPhoneticAlphabet
  end

  def test_consonant
    consonant = @faker_ipa.consonant

    assert_match(/^.$/, consonant)
  end

  def test_vowel
    vowel = @faker_ipa.vowel

    assert_match(/^.$/, vowel)
  end

  def test_consonant_amount
    amount = 5
    consonants = @faker_ipa.consonant(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_vowel_amount
    amount = 5
    vowels = @faker_ipa.vowel(amount: amount)

    assert_match(/^.{#{amount}}$/, vowels)
  end

  def test_vowel_high_front
    vowel = @faker_ipa.vowel_high_front

    assert_match(/^.$/, vowel)
  end

  def test_vowel_high_front_amount
    amount = 5
    vowels = @faker_ipa.vowel_high_front(amount: amount)

    assert_match(/^.{#{amount}}$/, vowels)
  end

  def test_vowel_high_central
    vowel = @faker_ipa.vowel_high_central

    assert_match(/^.$/, vowel)
  end

  def test_vowel_high_central_amount
    amount = 3
    vowels = @faker_ipa.vowel_high_central(amount: amount)

    assert_match(/^.{#{amount}}$/, vowels)
  end

  def test_vowel_high_back
    vowel = @faker_ipa.vowel_high_back

    assert_match(/^.$/, vowel)
  end

  def test_vowel_high_back_amount
    amount = 2
    vowels = @faker_ipa.vowel_high_back(amount: amount)

    assert_match(/^.{#{amount}}$/, vowels)
  end

  def test_vowel_mid_high_front
    vowel = @faker_ipa.vowel_mid_high_front

    assert_match(/^.$/, vowel)
  end

  def test_vowel_mid_high_front_amount
    amount = 2
    vowels = @faker_ipa.vowel_mid_high_front(amount: amount)

    assert_match(/^.{#{amount}}$/, vowels)
  end

  def test_vowel_mid_high_central
    vowel = @faker_ipa.vowel_mid_high_central

    assert_match(/^.$/, vowel)
  end

  def test_vowel_mid_high_central_amount
    amount = 3
    vowels = @faker_ipa.vowel_mid_high_central(amount: amount)

    assert_match(/^.{#{amount}}$/, vowels)
  end

  def test_vowel_mid_high_back
    vowel = @faker_ipa.vowel_mid_high_back

    assert_match(/^.$/, vowel)
  end

  def test_vowel_mid_high_back_amount
    amount = 3
    vowels = @faker_ipa.vowel_mid_high_back(amount: amount)

    assert_match(/^.{#{amount}}$/, vowels)
  end

  def test_vowel_mid_low_front
    vowel = @faker_ipa.vowel_mid_low_front

    assert_match(/^.$/, vowel)
  end

  def test_vowel_mid_low_front_amount
    amount = 3
    vowels = @faker_ipa.vowel_mid_low_front(amount: amount)

    assert_match(/^.{#{amount}}$/, vowels)
  end

  def test_vowel_mid_low_central
    vowel = @faker_ipa.vowel_mid_low_central

    assert_match(/^.$/, vowel)
  end

  def test_vowel_mid_low_central_amount
    amount = 3
    vowels = @faker_ipa.vowel_mid_low_central(amount: amount)

    assert_match(/^.{#{amount}}$/, vowels)
  end

  def test_vowel_mid_low_back
    vowel = @faker_ipa.vowel_mid_low_back

    assert_match(/^.$/, vowel)
  end

  def test_vowel_mid_low_back_amount
    amount = 2
    vowels = @faker_ipa.vowel_mid_low_back(amount: amount)

    assert_match(/^.{#{amount}}$/, vowels)
  end

  def test_vowel_low_front
    vowel = @faker_ipa.vowel_low_front

    assert_match(/^.$/, vowel)
  end

  def test_vowel_low_front_amount
    amount = 2
    vowels = @faker_ipa.vowel_low_front(amount: amount)

    assert_match(/^.{#{amount}}$/, vowels)
  end

  def test_vowel_low_back
    vowel = @faker_ipa.vowel_low_back

    assert_match(/^.$/, vowel)
  end

  def test_vowel_low_back_amount
    amount = 2
    vowels = @faker_ipa.vowel_low_back(amount: amount)

    assert_match(/^.{#{amount}}$/, vowels)
  end

  def test_consonant_bilabial_oral
    consonant = @faker_ipa.consonant_bilabial_oral

    assert_match(/^.$/, consonant)
  end

  def test_consonant_bilabial_oral_amount
    amount = 2
    consonants = @faker_ipa.consonant_bilabial_oral(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_bilabial_nasal
    consonant = @faker_ipa.consonant_bilabial_nasal

    assert_match(/^.$/, consonant)
  end

  def test_consonant_bilabial_nasal_amount
    amount = 2
    consonants = @faker_ipa.consonant_bilabial_nasal(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_bilabial_trill
    consonant = @faker_ipa.consonant_bilabial_trill

    assert_match(/^.$/, consonant)
  end

  def test_consonant_bilabial_trill_amount
    amount = 2
    consonants = @faker_ipa.consonant_bilabial_trill(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_bilabial_fricative
    consonant = @faker_ipa.consonant_bilabial_fricative

    assert_match(/^.$/, consonant)
  end

  def test_consonant_bilabial_fricative_amount
    amount = 2
    consonants = @faker_ipa.consonant_bilabial_fricative(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_bilabial_approximant
    consonant = @faker_ipa.consonant_bilabial_approximant

    assert_match(/^.$/, consonant)
  end

  def test_consonant_bilabial_approximant_amount
    amount = 2
    consonants = @faker_ipa.consonant_bilabial_approximant(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_labiodental_nasal
    consonant = @faker_ipa.consonant_labiodental_nasal

    assert_match(/^.$/, consonant)
  end

  def test_consonant_labiodental_nasal_amount
    amount = 2
    consonants = @faker_ipa.consonant_labiodental_nasal(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_labiodental_fricative
    consonant = @faker_ipa.consonant_labiodental_fricative

    assert_match(/^.$/, consonant)
  end

  def test_consonant_labiodental_fricative_amount
    amount = 2
    consonants = @faker_ipa.consonant_labiodental_fricative(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_dental_fricative
    consonant = @faker_ipa.consonant_dental_fricative

    assert_match(/^.$/, consonant)
  end

  def test_consonant_dental_fricative_amount
    amount = 2
    consonants = @faker_ipa.consonant_dental_fricative(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_alveolar_oral
    consonant = @faker_ipa.consonant_alveolar_oral

    assert_match(/^.$/, consonant)
  end

  def test_consonant_alveolar_oral_amount
    amount = 2
    consonants = @faker_ipa.consonant_alveolar_oral(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_alveolar_nasal
    consonant = @faker_ipa.consonant_alveolar_nasal

    assert_match(/^.$/, consonant)
  end

  def test_consonant_alveolar_nasal_amount
    amount = 2
    consonants = @faker_ipa.consonant_alveolar_nasal(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_alveolar_trill
    consonant = @faker_ipa.consonant_alveolar_trill

    assert_match(/^.$/, consonant)
  end

  def test_consonant_alveolar_trill_amount
    amount = 2
    consonants = @faker_ipa.consonant_alveolar_trill(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_alveolar_tap_or_flap
    consonant = @faker_ipa.consonant_alveolar_tap_or_flap

    assert_match(/^.$/, consonant)
  end

  def test_consonant_alveolar_tap_or_flap_amount
    amount = 2
    consonants = @faker_ipa.consonant_alveolar_tap_or_flap(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_alveolar_fricative
    consonant = @faker_ipa.consonant_alveolar_fricative

    assert_match(/^.$/, consonant)
  end

  def test_consonant_alveolar_fricative_amount
    amount = 2
    consonants = @faker_ipa.consonant_alveolar_fricative(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_alveolar_lateral_fricative
    consonant = @faker_ipa.consonant_alveolar_lateral_fricative

    assert_match(/^.$/, consonant)
  end

  def test_consonant_alveolar_lateral_fricative_amount
    amount = 2
    consonants = @faker_ipa.consonant_alveolar_lateral_fricative(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_alveolar_approximant
    consonant = @faker_ipa.consonant_alveolar_approximant

    assert_match(/^.$/, consonant)
  end

  def test_consonant_alveolar_approximant_amount
    amount = 2
    consonants = @faker_ipa.consonant_alveolar_approximant(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_alveolar_lateral_approximant
    consonant = @faker_ipa.consonant_alveolar_lateral_approximant

    assert_match(/^.$/, consonant)
  end

  def test_consonant_alveolar_lateral_approximant_amount
    amount = 2
    consonants = @faker_ipa.consonant_alveolar_lateral_approximant(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_postalveolar_affricate
    consonant = @faker_ipa.consonant_postalveolar_affricate

    assert_match(/^..$/, consonant)
  end

  def test_consonant_postalveolar_affricate_amount
    amount = 2
    consonants = @faker_ipa.consonant_postalveolar_affricate(amount: amount)

    assert_match(/^.{#{amount * 2}}$/, consonants)
  end

  def test_consonant_postalveolar_fricative
    consonant = @faker_ipa.consonant_postalveolar_fricative

    assert_match(/^.$/, consonant)
  end

  def test_consonant_postalveolar_fricative_amount
    amount = 3
    consonants = @faker_ipa.consonant_postalveolar_fricative(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_retroflex_oral
    consonant = @faker_ipa.consonant_retroflex_oral

    assert_match(/^.$/, consonant)
  end

  def test_consonant_retroflex_oral_amount
    amount = 3
    consonants = @faker_ipa.consonant_retroflex_oral(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_retroflex_nasal
    consonant = @faker_ipa.consonant_retroflex_nasal

    assert_match(/^.$/, consonant)
  end

  def test_consonant_retroflex_nasal_amount
    amount = 3
    consonants = @faker_ipa.consonant_retroflex_nasal(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_retroflex_tap_or_flap
    consonant = @faker_ipa.consonant_retroflex_tap_or_flap

    assert_match(/^.$/, consonant)
  end

  def test_consonant_retroflex_tap_or_flap_amount
    amount = 3
    consonants = @faker_ipa.consonant_retroflex_tap_or_flap(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_retroflex_fricative
    consonant = @faker_ipa.consonant_retroflex_fricative

    assert_match(/^.$/, consonant)
  end

  def test_consonant_retroflex_fricative_amount
    amount = 3
    consonants = @faker_ipa.consonant_retroflex_fricative(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_retroflex_approximant
    consonant = @faker_ipa.consonant_retroflex_approximant

    assert_match(/^.$/, consonant)
  end

  def test_consonant_retroflex_approximant_amount
    amount = 3
    consonants = @faker_ipa.consonant_retroflex_approximant(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_retroflex_lateral_approximant
    consonant = @faker_ipa.consonant_retroflex_lateral_approximant

    assert_match(/^.$/, consonant)
  end

  def test_consonant_retroflex_lateral_approximant_amount
    amount = 3
    consonants = @faker_ipa.consonant_retroflex_lateral_approximant(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_palatal_oral
    consonant = @faker_ipa.consonant_palatal_oral

    assert_match(/^.$/, consonant)
  end

  def test_consonant_palatal_oral_amount
    amount = 3
    consonants = @faker_ipa.consonant_palatal_oral(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_palatal_nasal
    consonant = @faker_ipa.consonant_palatal_nasal

    assert_match(/^.$/, consonant)
  end

  def test_consonant_palatal_nasal_amount
    amount = 3
    consonants = @faker_ipa.consonant_palatal_nasal(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_palatal_fricative
    consonant = @faker_ipa.consonant_palatal_fricative

    assert_match(/^.$/, consonant)
  end

  def test_consonant_palatal_fricative_amount
    amount = 3
    consonants = @faker_ipa.consonant_palatal_fricative(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_palatal_approximant
    consonant = @faker_ipa.consonant_palatal_approximant

    assert_match(/^.$/, consonant)
  end

  def test_consonant_palatal_approximant_amount
    amount = 3
    consonants = @faker_ipa.consonant_palatal_approximant(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_palatal_lateral_approximant
    consonant = @faker_ipa.consonant_palatal_lateral_approximant

    assert_match(/^.$/, consonant)
  end

  def test_consonant_palatal_lateral_approximant_amount
    amount = 3
    consonants = @faker_ipa.consonant_palatal_lateral_approximant(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_velar_oral
    consonant = @faker_ipa.consonant_velar_oral

    assert_match(/^.$/, consonant)
  end

  def test_consonant_velar_oral_amount
    amount = 3
    consonants = @faker_ipa.consonant_velar_oral(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_velar_nasal
    consonant = @faker_ipa.consonant_velar_nasal

    assert_match(/^.$/, consonant)
  end

  def test_consonant_velar_nasal_amount
    amount = 3
    consonants = @faker_ipa.consonant_velar_nasal(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_velar_fricative
    consonant = @faker_ipa.consonant_velar_fricative

    assert_match(/^.$/, consonant)
  end

  def test_consonant_velar_fricative_amount
    amount = 3
    consonants = @faker_ipa.consonant_velar_fricative(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_velar_approximant
    consonant = @faker_ipa.consonant_velar_approximant

    assert_match(/^.$/, consonant)
  end

  def test_consonant_velar_approximant_amount
    amount = 3
    consonants = @faker_ipa.consonant_velar_approximant(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_velar_lateral_approximant
    consonant = @faker_ipa.consonant_velar_lateral_approximant

    assert_match(/^.$/, consonant)
  end

  def test_consonant_velar_lateral_approximant_amount
    amount = 3
    consonants = @faker_ipa.consonant_velar_lateral_approximant(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def consonant_uvular_oral
    consonant = @faker_ipa.consonant_uvular_oral

    assert_match(/^.$/, consonant)
  end

  def consonant_uvular_oral_amount
    amount = 3
    consonants = @faker_ipa.consonant_uvular_oral(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_uvular_nasal
    consonant = @faker_ipa.consonant_uvular_nasal

    assert_match(/^.$/, consonant)
  end

  def test_consonant_uvular_nasal_amount
    amount = 3
    consonants = @faker_ipa.consonant_uvular_nasal(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_uvular_trill
    consonant = @faker_ipa.consonant_uvular_trill

    assert_match(/^.$/, consonant)
  end

  def test_consonant_uvular_trill_amount
    amount = 3
    consonants = @faker_ipa.consonant_uvular_trill(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_uvular_fricative
    consonant = @faker_ipa.consonant_uvular_fricative

    assert_match(/^.$/, consonant)
  end

  def test_consonant_uvular_fricative_amount
    amount = 3
    consonants = @faker_ipa.consonant_uvular_fricative(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_pharyngeal_fricative
    consonant = @faker_ipa.consonant_pharyngeal_fricative

    assert_match(/^.$/, consonant)
  end

  def test_consonant_pharyngeal_fricative_amount
    amount = 3
    consonants = @faker_ipa.consonant_pharyngeal_fricative(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_global_oral
    consonant = @faker_ipa.consonant_global_oral

    assert_match(/^.$/, consonant)
  end

  def test_consonant_global_oral_amount
    amount = 3
    consonants = @faker_ipa.consonant_global_oral(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end

  def test_consonant_global_fricative
    consonant = @faker_ipa.consonant_global_fricative

    assert_match(/^.$/, consonant)
  end

  def test_consonant_global_fricative_amount
    amount = 3
    consonants = @faker_ipa.consonant_global_fricative(amount: amount)

    assert_match(/^.{#{amount}}$/, consonants)
  end
end
