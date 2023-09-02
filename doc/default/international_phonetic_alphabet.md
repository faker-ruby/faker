# Faker::InternationalPhoneticAlphabet

```ruby
Faker::InternationalPhoneticAlphabet.consonant #=> "ɖ"
Faker::InternationalPhoneticAlphabet.consonant(amount: 4) #=> "ɖʒɲf"

Faker::InternationalPhoneticAlphabet.vowel #=> "i"
Faker::InternationalPhoneticAlphabet.vowel(amount: 4) #=> "iœʉɛ"

Faker::InternationalPhoneticAlphabet.vowel_high_front #=> "i"
Faker::InternationalPhoneticAlphabet.vowel_high_front(amount: 4) #=> "iyɪʏ"

Faker::InternationalPhoneticAlphabet.vowel_high_central #=> "ɨ"
Faker::InternationalPhoneticAlphabet.vowel_high_central(amount: 3) #=> "ɨʉʊ"

Faker::InternationalPhoneticAlphabet.vowel_high_back #=> "ɯ"
Faker::InternationalPhoneticAlphabet.vowel_high_back(amount: 2) #=> "ɯu"

Faker::InternationalPhoneticAlphabet.vowel_mid_high_front #=> "e"
Faker::InternationalPhoneticAlphabet.vowel_mid_high_front(amount: 2) #=> "eø"

Faker::InternationalPhoneticAlphabet.vowel_mid_high_central #=> "ɘ"
Faker::InternationalPhoneticAlphabet.vowel_mid_high_central(amount: 3) #=> "ɘɵə"

Faker::InternationalPhoneticAlphabet.vowel_mid_high_back #=> "ɤ"
Faker::InternationalPhoneticAlphabet.vowel_mid_high_back(amount: 2) #=> "ɤo"

Faker::InternationalPhoneticAlphabet.vowel_mid_low_front #=> "ɛ"
Faker::InternationalPhoneticAlphabet.vowel_mid_low_front(amount: 3) #=> "ɛœæ"

Faker::InternationalPhoneticAlphabet.vowel_mid_low_central #=> "ɜ"
Faker::InternationalPhoneticAlphabet.vowel_mid_low_central(amount: 3) #=> "ɜɞɐ"

Faker::InternationalPhoneticAlphabet.vowel_mid_low_back #=> "ʌ"
Faker::InternationalPhoneticAlphabet.vowel_mid_low_back(amount: 2) #=> "ʌɔ"

Faker::InternationalPhoneticAlphabet.vowel_low_front #=> "a"
Faker::InternationalPhoneticAlphabet.vowel_low_front(amount: 2) #=> "aɶ"

Faker::InternationalPhoneticAlphabet.vowel_low_back #=> "ɑ"
Faker::InternationalPhoneticAlphabet.vowel_low_back(amount: 2) #=> "ɑɒ"

Faker::InternationalPhoneticAlphabet.consonant_bilabial_oral #=> "p"
Faker::InternationalPhoneticAlphabet.consinant_bilabial_oral(amount: 2) #=> "pb"

Faker::InternationalPhoneticAlphabet.consonant_bilabial_nasal #=> "m"
Faker::InternationalPhoneticAlphabet.consonant_bilabial_nasal(amount: 4) #=> "mmmm"

Faker::InternationalPhoneticAlphabet.consonant_bilabial_trill #=> "ʙ"
Faker::InternationalPhoneticAlphabet.consonant_bilabial_trill(amount: 4) #=> "ʙʙʙʙ"

Faker::InternationalPhoneticAlphabet.consonant_bilabial_fricative #=> "ɸβ"
Faker::InternationalPhoneticAlphabet.consonant_bilabial_fricative(amount: 2) #=> "ɸβ"

Faker::InternationalPhoneticAlphabet.consonant_bilabial_approximant #=> "ʋ"
Faker::InternationalPhoneticAlphabet.consonant_bilabial_approximant(amount: 2) #=> "ʋw"

Faker::InternationalPhoneticAlphabet.consonant_labiodental_nasal #=> "ɱ"
Faker::InternationalPhoneticAlphabet.consonant_labiodental_nasal(amount: 4) #=> "ɱɱɱɱ"

Faker::InternationalPhoneticAlphabet.consonant_labiodental_fricative #=> "v"
Faker::InternationalPhoneticAlphabet.consonant_labiodental_fricative(amount: 4) #=> "vvvv"

Faker::InternationalPhoneticAlphabet.consonant_dental_fricative #=> "θ"
Faker::InternationalPhoneticAlphabet.consonant_dental_fricative(amount: 2) #=> "θð"

Faker::InternationalPhoneticAlphabet.consonant_alveolar_oral #=> "t"
Faker::InternationalPhoneticAlphabet.consonant_alveolar_oral(amount: 4) #=> "tddt"

Faker::InternationalPhoneticAlphabet.consonant_alveolar_nasal #=> "n"
Faker::InternationalPhoneticAlphabet.consonant_alveolar_nasal(amount: 4) #=> "nnnn"

Faker::InternationalPhoneticAlphabet.consonant_alveolar_trill #=> "r"
Faker::InternationalPhoneticAlphabet.consonant_alveolar_trill(amount: 4) #=> "rrrr"

Faker::InternationalPhoneticAlphabet.consonant_alveolar_tap_or_flap #=> "ɾ"
Faker::InternationalPhoneticAlphabet.consonant_alveolar_tap_or_flap(amount: 3) #=> "ɾɾɾ"

Faker::InternationalPhoneticAlphabet.consonant_alveolar_fricative #=> "s"
Faker::InternationalPhoneticAlphabet.consonant_alveolar_fricative(amount: 3) #=> "szz"

Faker::InternationalPhoneticAlphabet.consonant_alveolar_lateral_fricative #=> "ɬ"
Faker::InternationalPhoneticAlphabet.consonant_alveolar_lateral_fricative(amount: 4) #=> "ɬɬɮɬ"

Faker::InternationalPhoneticAlphabet.consonant_alveolar_approximant #=> "ɹ"
Faker::InternationalPhoneticAlphabet.consonant_alveolar_approximant(amount: 4) #=> "ɹɹɹɹɹ"

Faker::InternationalPhoneticAlphabet.consonant_alveolar_lateral_approximant #=> "l"
Faker::InternationalPhoneticAlphabet.consonant_alveolar_lateral_approximant(amount: 4) #=> "llll"

Faker::InternationalPhoneticAlphabet.consonant_postalveolar_affricate #=> "tʃ"
Faker::InternationalPhoneticAlphabet.consonant_postalveolar_affricate(amount: 4) #=> "dʒtʃdʒtʃ"

Faker::InternationalPhoneticAlphabet.consonant_postalveolar_fricative #=> "ʒ"
Faker::InternationalPhoneticAlphabet.consonant_postalveolar_fricative(amount: 3) #=> "ʃʒʒ"

Faker::InternationalPhoneticAlphabet.consonant_retroflex_oral #=> "ʈ"
Faker::InternationalPhoneticAlphabet.consonant_retroflex_oral(amount: 2) #=> "ʈɖ"

Faker::InternationalPhoneticAlphabet.consonant_retroflex_nasal #=> "ɳ"
Faker::InternationalPhoneticAlphabet.consonant_retroflex_nasal(amount: 3) #=> "ɳɳɳ"

Faker::InternationalPhoneticAlphabet.consonant_retroflex_tap_or_flap #=> "ɽ"
Faker::InternationalPhoneticAlphabet.consonant_retroflex_tap_or_flap(amount: 3) #=> "ɽɽɽ"

Faker::InternationalPhoneticAlphabet.consonant_retroflex_fricative #=> "ʂ"
Faker::InternationalPhoneticAlphabet.consonant_retroflex_fricative(amount: 2) #=> "ʂʐ"

Faker::InternationalPhoneticAlphabet.consonant_retroflex_approximant #=> "ɻ"
Faker::InternationalPhoneticAlphabet.consonant_retroflex_approximant(amount: 3) #=> "ɻɻɻ"

Faker::InternationalPhoneticAlphabet.consonant_retroflex_lateral_approximant #=> "ɭ"
Faker::InternationalPhoneticAlphabet.consonant_retroflex_lateral_approximant(amount: 3) #=> "ɭɭɭ"

Faker::InternationalPhoneticAlphabet.consonant_palatal_oral #=> "c"
Faker::InternationalPhoneticAlphabet.consonant_palatal_oral(amount: 4) #=> "cɟcɟ"

Faker::InternationalPhoneticAlphabet.consonant_palatal_nasal #=> "ɲ"
Faker::InternationalPhoneticAlphabet.consonant_palatal_nasal(amount: 3) #=> "ɲɲɲ"

Faker::InternationalPhoneticAlphabet.consonant_palatal_fricative #=> "ç"
Faker::InternationalPhoneticAlphabet.consonant_palatal_fricative(amount: 3) #=> "çʝʝ"

Faker::InternationalPhoneticAlphabet.consonant_palatal_approximant #=> "j"
Faker::InternationalPhoneticAlphabet.consonant_palatal_approximant(amount: 2) #=> "jj"

Faker::InternationalPhoneticAlphabet.consonant_palatal_lateral_approximant #=> "ʎ"
Faker::InternationalPhoneticAlphabet.consonant_palatal_lateral_approximant(amount: 2) #=> "ʎʎ"

Faker::InternationalPhoneticAlphabet.consonant_velar_oral #=> "k"
Faker::InternationalPhoneticAlphabet.consonant_velar_oral(amount: 2) #=> "kg"

Faker::InternationalPhoneticAlphabet.consonant_velar_nasal #=> "ŋ"
Faker::InternationalPhoneticAlphabet.consonant_velar_nasal(amount: 2) #=> "ŋŋ"

Faker::InternationalPhoneticAlphabet.consonant_velar_fricative #=> "x"
Faker::InternationalPhoneticAlphabet.consonant_velar_fricative(amount: 2) #=> "xɣ"

Faker::InternationalPhoneticAlphabet.consonant_velar_approximant #=> "ɰ"
Faker::InternationalPhoneticAlphabet.consonant_velar_approximant(amount: 2) #=> "ɰw"

Faker::InternationalPhoneticAlphabet.consonant_velar_lateral_approximant #=> "ʟ"
Faker::InternationalPhoneticAlphabet.consonant_velar_lateral_approximant(amount: 2) #=> "ʟʟ"

Faker::InternationalPhoneticAlphabet.consonant_uvular_oral #=> "q"
Faker::InternationalPhoneticAlphabet.consonant_uvular_oral(amount: 2) #=> "qɢ"

Faker::InternationalPhoneticAlphabet.consonant_uvular_nasal #=> "ɴ"
Faker::InternationalPhoneticAlphabet.consonant_uvular_nasal(amount: 2) #=> "ɴɴ"

Faker::InternationalPhoneticAlphabet.consonant_uvular_trill #=> "ʀ"
Faker::InternationalPhoneticAlphabet.consonant_uvular_trill(amount: 2) #=> "ʀʀ"

Faker::InternationalPhoneticAlphabet.consonant_uvular_fricative #=> "χʁ"
Faker::InternationalPhoneticAlphabet.consonant_uvular_fricative(amount: 2) #=> "χʁ"

Faker::InternationalPhoneticAlphabet.consonant_pharyngeal_fricative #=> "ħ"
Faker::InternationalPhoneticAlphabet.consonant_pharyngeal_fricative(amount: 3) #=> "ħʕʕ"

Faker::InternationalPhoneticAlphabet.consonant_global_oral #=> "ʔ"
Faker::InternationalPhoneticAlphabet.consonant_global_oral(amount: 3) #=> "ʔʔʔ"

Faker::InternationalPhoneticAlphabet.consonant_global_fricative #=> "h"
Faker::InternationalPhoneticAlphabet.consonant_global_fricative(amount: 3) #=> "hhɦ"
```
