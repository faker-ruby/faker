# Faker::Address

Available since version 0.3.0.

```ruby
Faker::Address.city #=> "Imogeneborough"

Faker::Address.street_name #=> "Larkin Fork"

Faker::Address.street_address #=> "282 Kevin Brook"

Faker::Address.secondary_address #=> "Apt. 672"

Faker::Address.building_number #=> "7304"

Faker::Address.mail_box #=> "PO Box 123"

Faker::Address.community #=> "University Crossing"

Faker::Address.zip_code #=> "58517" or "23285-4905"

Faker::Address.zip #=> "58517" or "66259-8212"

Faker::Address.postcode #=> "76032-4907" or "58517"

Faker::Address.time_zone #=> "Asia/Yakutsk"

Faker::Address.street_suffix #=> "Street"

Faker::Address.city_suffix #=> "fort"

Faker::Address.city_prefix #=> "Lake"

Faker::Address.state #=> "California"

Faker::Address.state_abbr #=> "AP"

Faker::Address.country #=> "French Guiana"

# Keyword arguments: code
Faker::Address.country_by_code(code: 'NL') #=> "Netherlands"

# Keyword arguments: name
Faker::Address.country_name_to_code(name: 'united_states') #=> "US"

Faker::Address.country_code #=> "IT"

Faker::Address.country_code_long #=> "ITA"

Faker::Address.latitude #=> "-58.17256227443719"

Faker::Address.longitude #=> "-156.65548382095133"

Faker::Address.full_address #=> "282 Kevin Brook, Imogeneborough, CA 58517"
```
