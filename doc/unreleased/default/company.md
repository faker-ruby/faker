# Faker::Company

```ruby
Faker::Company.name #=> "Hirthe-Ritchie"

Faker::Company.suffix #=> "Group"

Faker::Company.industry #=> "Information Services"

# Generate a buzzword-laden catch phrase.
Faker::Company.catch_phrase #=> "Business-focused coherent parallelism"

Faker::Company.buzzword #=> "Business-focused"

# When a straight answer won't do, BS to the rescue!
Faker::Company.bs #=> "empower one-to-one web-readiness"

# Generate US employee identification numbers
Faker::Company.ein #=> "34-8488813"

# Generate "Data Universal Numbering System"
Faker::Company.duns_number #=> "08-341-3736"

# Get a random company logo url in PNG format.
Faker::Company.logo #=> "https://pigment.github.com/fake-logos/logos/medium/color/5.png"

Faker::Company.type #=> "Privately Held"

# Get a random profession
Faker::Company.profession #=> "firefighter"

# Generate country specific identifiers

Faker::Company.swedish_organisation_number #=> "7962578022"

Faker::Company.czech_organisation_number #=> "77778171"

Faker::Company.french_siren_number #=> "819489626"

Faker::Company.french_siret_number #=> "81948962600013"

Faker::Company.norwegian_organisation_number #=> "839071558"

Faker::Company.australian_business_number #=> "81137773602"

Faker::Company.spanish_organisation_number #=> "P2344979"

# Get a random Polish taxpayer identification number
Faker::Company.polish_taxpayer_identification_number #=> "1060000062"

# Get a random Polish register of national economy number
Faker::Company.polish_register_of_national_economy #=> "123456785"

# Generate South African company registration numbers:
Faker::Company.south_african_pty_ltd_registration_number #=> "5301/714689/07"
Faker::Company.south_african_close_corporation_registration_number #=> "CK74/7585/23"
Faker::Company.south_african_listed_company_registration_number #=> "7039/3135/06"
Faker::Company.south_african_trust_registration_number #=> "IT38/6489900"

# Generate a Brazilian company number (CNPJ)
Faker::Company.brazilian_company_number #=> "18553414000618"
```
