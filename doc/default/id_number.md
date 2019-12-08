# Faker::IDNumber

```ruby
# Generate a valid US Social Security number
Faker::IDNumber.valid #=> "552-56-3593"

# Generate an invalid US Social Security number
Faker::IDNumber.invalid #=> "311-72-0000"

# Generate a Spanish citizen identifier (DNI)
Faker::IDNumber.spanish_citizen_number #=> "53290236-H"

# Generate a Spanish foreign born citizen identifier (NIE)
Faker::IDNumber.spanish_foreign_citizen_number #=> "Z-1600870-Y"

# Generate a valid South African ID Number
Faker::IDNumber.south_african_id_number #=> "8105128870184"
# or
Faker::IDNumber.valid_south_african_id_number #=> "8105128870184"

# Generate an invalid South African ID Number
Faker::IDNumber.invalid_south_african_id_number #=> "1642972065088"

# Generate a Brazilian citizen number (CPF)
# Keyword arguments: formatted
Faker::IDNumber.brazilian_citizen_number #=> "53540542221"
Faker::IDNumber.brazilian_citizen_number(formatted: true) #=> 000.000.000-00

# Generate a Brazilian ID Number (RG)
# Keyword arguments: formatted
Faker::IDNumber.brazilian_id #=> 1212312312
Faker::IDNumber.brazilian_id(formatted: true) #=> 12.123.123-12

# Generate a Chilean ID (Rut with 8 digits)
# For more advanced cases, please refer to Faker::ChileRut
Faker::IDNumber.chilean_id #=> "15620613-K"
```