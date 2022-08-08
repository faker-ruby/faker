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
Faker::IDNumber.brazilian_citizen_number(formatted: true) #=> "535.405.422-21"

# Generate a Brazilian ID Number (RG)
# Keyword arguments: formatted
Faker::IDNumber.brazilian_id #=> "493054029"
Faker::IDNumber.brazilian_id(formatted: true) #=> "49.305.402-9"

# Generate a Chilean ID (Rut with 8 digits)
# For more advanced cases, please refer to Faker::ChileRut
Faker::IDNumber.chilean_id #=> "15620613-K"

# Generate a Croatian ID number (OIB)
# Keyword arguments: international
Faker::IDNumber.croatian_id #=> "88467617508"
Faker::IDNumber.croatian_id(international: true) #=> "HR88467617508"

# Generate a Danish ID number (CPR)
# Keyword arguments: formatted, gender, birthday
Faker::IDNumber.danish_id_number #=> "050390-9980"
Faker::IDNumber.danish_id_number(formatted: true) #=> "050390-9980"
Faker::IDNumber.danish_id_number(birthday: Date.new(1990, 3, 5)) #=> "050390-9980"
Faker::IDNumber.danish_id_number(gender: :female) #=> "050390-9980"
```
