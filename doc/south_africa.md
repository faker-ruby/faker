# Faker::SouthAfrica

It might be available in the next version.

Generate South African ID Numbers and phone numbers. Delegates as needed to
`Faker::IdNumber` and `Faker::PhoneNumber`.

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
```
