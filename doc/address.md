# Faker::Address

```ruby
Faker::Address.city #=> "Imogeneborough"
## Count ##
# bg: dynamic # ca-CAT: 62 # da-DK: dynamic # de-AT: dynamic # de: 4 # en-au-ocker: dynamic # en-IND: 8 # en-MS: dynamic # nep: 16 # en-NG: dynamic # en-UG: dynamic # en-ZA: dynamic # es-MX: dynamic # es: dynamic # fi-FI: dynamic # fr: dynamic # he: 2 # id: dynamic # it: 4 # ja: 4 # ko: dynamic # nb-NO: dynamic # nl: 4 # pl: dynamic # pt: dynamic # ru: dynamic # sk: dynamic # sv: dynamic # tr: dynamic # uk: dynamic # vi: dynamic # zh-CN: dynamic # zh-TW: dynamic 

Faker::Address.street_name #=> "Larkin Fork"
## Count ##
# bg: dynamic # ca-CAT: 3 # da-DK: 4 # de-AT: dynamic # de: dynamic # en-au-ocker: dynamic # en-MS: dynamic # en-SG: 3 # es-MX: 4 # es: 2 # fi-FI: dynamic # fr: dynamic # he: dynamic # id: dynamic # it: 2 # ja: 2 # ko: dynamic # nb-NO: 4 # nl: 2 # pl: dynamic # pt-BR: 2 # ru: 2 # sk: dynamic # sv: 4 # uk: 2 # zh-CN: dynamic # zh-TW: dynamic 

Faker::Address.street_address #=> "282 Kevin Brook"
## Count ##
# bg: dynamic # ca-CAT: 2 # da-DK: dynamic # de-AT: dynamic # de: dynamic # en-MS: dynamic # en-SG: dynamic # es-MX: 2 # es: 2 # fi-FI: dynamic # fr: dynamic # he: 2 # id: dynamic # it: 2 # nb-NO: dynamic # nl: dynamic # pl: dynamic # ru: dynamic # sk: dynamic # sv: dynamic # uk: dynamic # zh-CN: dynamic # zh-TW: dynamic 

Faker::Address.secondary_address #=> "Apt. 672"
## Count ##
# ca-CAT: 2 # da-DK: 5 # de-AT: 3 # de: 3 # es-MX: 11 # es: 2 # fr: 2 # it: 2 # nb-NO: 3 # nl: 3 # pl: 2 # pt-BR: 5 # pt: 5 # ru: dynamic # sk: 2 # sv: 2 # uk: 3 

Faker::Address.building_number #=> "7304"
## Count ##
# bg: 3 # ca-CAT: 5 # da-DK: 3 # de-AT: 6 # de: 6 # en-au-ocker: 3 # en-AU: 3 # en-MS: dynamic # en-NZ: 3 # en-SG: 3 # es-MX: 6 # es: 5 # fi-FI: 3 # fr: 4 # he: 2 # id: dynamic # it: 3 # nb-NO: 2 # nl: 9 # pl: 3 # pt-BR: 4 # pt: 3 # ru: dynamic # sk: 3 # sv: 3 # uk: 3 # zh-CN: 5 # zh-TW: 3 

Faker::Address.community #=> "University Crossing"

Faker::Address.zip_code #=> "58517" or "23285-4905"

Faker::Address.zip #=> "58517" or "66259-8212"

Faker::Address.postcode #=> "76032-4907" or "58517"
## Count ##
# bg: dynamic # ca-CAT: dynamic # da-DK: dynamic # de-AT: dynamic # de-CH: 9 # de: 2 # en-au-ocker: 7 # en-AU: 7 # en-CA: dynamic # en-GB: dynamic # en-IND: dynamic # en-MS: dynamic # nep: dynamic # en-NZ: 9 # en-PAK: dynamic # en-SG: dynamic # es-MX: dynamic # es: dynamic # fi-FI: dynamic # fr: dynamic # id: dynamic # it: dynamic # ja: dynamic # ko: dynamic # nb-NO: 4 # nl: dynamic # pl: dynamic # pt-BR: dynamic # pt: dynamic # ru: dynamic # sk: 3 # sv: dynamic # uk: dynamic # vi: dynamic # zh-CN: dynamic # zh-TW: dynamic 

Faker::Address.time_zone #=> "Asia/Yakutsk"
## Count ##
# de: 4 # es-MX: 124 # es: 143 # sk: 143 

Faker::Address.street_suffix #=> "Street"
## Count ##
# bg: 6 # ca-CAT: 16 # da-DK: 4 # en-au-ocker: 37 # en-AU: 37 # en-NG: 71 # en-NZ: 37 # es: 70 # fi-FI: 3 # fr: 66 # it: 7 # ko: 3 # nb-NO: 46 # nl: 5 # pt-BR: 8 # pt: 8 # ru: 6 # sv: 5 # uk: dynamic # zh-CN: 8 # zh-TW: 6 

Faker::Address.city_suffix #=> "fort"
## Count ##
# da-DK: 25 # de: 11 # es-MX: dynamic # fi-FI: 10 # it: 12 # ja: 5 # ko: 3 # nb-NO: 28 # nl: 29 # pt-BR: 4 # pt: dynamic # sk: 19 # sv: 19 # uk: dynamic # zh-CN: 19 # zh-TW: 211 

Faker::Address.city_prefix #=> "Lake"
## Count ##
# da-DK: 22 # de: 10 # en-au-ocker: 12 # es-MX: dynamic # es: 129 # fi-FI: 10 # he: 4 # it: 5 # ja: 8 # nl: 6 # pt-BR: 5 # pt: dynamic # sk: 7 # sv: 25 # uk: dynamic # zh-CN: 21 # zh-TW: 211 

Faker::Address.state #=> "California"
## Count ##
# ca-CAT: 42 # da-DK: 5 # de-AT: 9 # de: 16 # en-au-ocker: 8 # en-AU: 8 # en-CA: 13 # en-IND: 35 # nep: 53 # en-NG: 39 # en-PAK: 8 # es-MX: 32 # es: 17 # fi-FI: 7 # fr: 27 # it: 110 # ja: 47 # ko: 17 # nb-NO: 20 # nl: 11 # pl: 16 # pt-BR: 27 # pt: 18 # ru: 86 # sk: 8 # sv: 23 # uk: 27 # zh-CN: 33 # zh-TW: 30 

Faker::Address.state_abbr #=> "AP"
## Count ##
# de-AT: 9 # de: 16 # en-au-ocker: 8 # en-AU: 8 # en-CA: 13 # en-IND: 35 # es-MX: 32 # es: 17 # it: 110 # ja: 47 # ko: 17 # pl: 16 # pt-BR: 24 # sk: 8 # uk: dynamic # zh-CN: 33 # zh-TW: 15 

Faker::Address.country #=> "French Guiana"
## Count ##
# bg: 248 # ca-CAT: 195 # da-DK: 205 # de-AT: 237 # de: 237 # es-MX: 250 # es: 180 # it: 241 # nl: 256 # pl: 197 # pt-BR: 237 # pt: 237 # ru: 210 # sk: 382 # sv: 205 # tr: 9 # uk: 193 

Faker::Address.country_code #=> "IT"
## Count ##
# de-CH: 10 # es-MX: 248 

Faker::Address.country_code_long #=> "ITA"

Faker::Address.latitude #=> "-58.17256227443719"

Faker::Address.longitude #=> "-156.65548382095133"

```
