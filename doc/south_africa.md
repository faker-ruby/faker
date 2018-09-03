# Faker::SouthAfrica

It might be available in the next version.

Generate South African ID Numbers, phone numbers and company registration
numbers. Delegates as needed to `Faker::IdNumber`, `Faker::PhoneNumber` and
`Faker::Company`

```ruby
# Generate a valid South African ID Number
Faker::SouthAfrica.id_number #=> "6110311856083"
# or
Faker::SouthAfrica.valid_id_number #=> "6110311856083"

# Generate an invalid South African ID Number
Faker::SouthAfrica.invalid_id_number #=> "7018356904081"

# Generate phone numbers
Faker::SouthAfrica.phone_number #=> "010 788 5009"

Faker::SouthAfrica.cell_phone #=> "082 946 7470"

# Generate South African company registration numbers:
Faker::SouthAfrica.pty_ltd_registration_number #=> "5301/714689/07"
Faker::SouthAfrica.close_corporation_registration_number #=> "CK74/7585/23"
Faker::SouthAfrica.listed_company_registration_number #=> "7039/3135/06"
Faker::SouthAfrica.trust_registration_number #=> "IT38/6489900"
Faker::SouthAfrica.vat_number #=> "ZA79494416181"
```
