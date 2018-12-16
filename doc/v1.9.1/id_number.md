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

# Generate a Brazilian Citizen Number (CPF)
Faker::IDNumber.brazilian_citizen_number #=> "03522455657"
Faker::IDNumber.brazilian_citizen_number(formatted: true) #=> "006.726.029-20"
Faker::IDNumber.brazilian_cpf #=> "03522455657"
Faker::IDNumber.brazilian_cpf(formatted: true) #=> "006.726.029-20"

# Generate a Brazilian ID (RG)
Faker::IDNumber.brazilian_id #=> "924805353"
Faker::IDNumber.brazilian_id(formatted: true) #=> "68.456.954-1"
Faker::IDNumber.brazilian_rg #=> "924805353"
Faker::IDNumber.brazilian_rg(formatted: true) #=> "68.456.954-1"
```
