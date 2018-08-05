# Faker::SouthAfrica

Generate South African ID Numbers and phone numbers. Delegates as needed to
`Faker::IdNumber` and `Faker::PhoneNumber`.

```ruby
Faker::SouthAfrica.valid_id_number #=> "6110311856083"

Faker::SouthAfrica.invalid_id_number #=> "7018356904081"

Faker::SouthAfrica.phone_number #=> "010 788 5009"

Faker::SouthAfrica.cell_phone #=> "082 946 7470"
```
