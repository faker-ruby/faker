# Faker::IDNumber

```ruby
# Generate a valid US Social Security number
Faker::IDNumber.valid #=> "552-56-3593"

# Generate an invalid US Social Security number
Faker::IDNumber.invalid #=> "311-72-0000"

# Generate a Spanish citizen identifier (DNI)
Faker::IDNumber.spanish_citizen_number

# Generate a Spanish foreign born citizen identifier (NIE)
Faker::IDNumber.spanish_foreign_citizen_number
```
