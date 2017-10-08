# Faker::Company

```ruby
Faker::Company.name #=> "Hirthe-Ritchie"
## Count ##
# da-DK: 3 # de-AT: 3 # de-CH: 3 # de: 3 # en: 3 # es-MX: 5 # es: 4 # fr: 2 # it: 3 # ja: 2 # ko: 2 # nb-NO: 3 # pl: 3 # pt-BR: 3 # pt: 3 # ru: 8 # sk: 3 # sv: 3 # uk: 5 # vi: dynamic 

Faker::Company.suffix #=> "Group"
## Count ##
# da-DK: 8 # de-AT: 7 # de-CH: 8 # de: 7 # en-au-ocker: 6 # en-AU: 6 # en-IND: 7 # nep: 4 # en-NZ: 6 # en-PAK: 8 # en: 4 # es-MX: 5 # es: 4 # fr: 8 # it: 4 # ja: 5 # ko: 6 # nb-NO: 6 # nl: 4 # pl: 6 # pt-BR: 5 # pt: 5 # ru: 5 # sk: 3 # sv: 7 # uk: 5 

# Generate a buzzword-laden catch phrase.
Faker::Company.catch_phrase #=> "Business-focused coherent parallelism"

Faker::Company.buzzword #=> "Business-focused"
## Count ##
# en: 3 # es: 3 # fr: 3 # it: 3 # pl: 3 # sk: 3 

# When a straight answer won't do, BS to the rescue!
Faker::Company.bs #=> "empower one-to-one web-readiness"
## Count ##
# en: 3 # fr: 3 # it: 3 # pl: 3 # sk: 3 

Faker::Company.ein #=> "34-8488813"

Faker::Company.duns_number #=> "08-341-3736"

# Get a random company logo url in PNG format.
Faker::Company.logo #=> "https://pigment.github.com/fake-logos/logos/medium/color/5.png"

Faker::Company.swedish_organisation_number #=> "7962578022"

Faker::Company.norwegian_organisation_number #=> "839071558"

# Generate an Australian Business Number
Faker::Company.australian_business_number #=> "81137773602"

# Get a random profession
Faker::Company.profession #=> "firefighter"
## Count ##
# en: 27 # es: 26 
```
