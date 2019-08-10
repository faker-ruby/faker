# Faker::Bank
```ruby

Faker::Bank.account_number #=> 6738582379

# Keyword arguments: digits
Faker::Bank.account_number(digits: 13) #=> 673858237902

Faker::Bank.iban #=> "GB76DZJM33188515981979"

# Keyword arguments: country_code
# All countries should be supported
Faker::Bank.iban(country_code: "be") #=> "BE6375388567752043"

Faker::Bank.name #=> "ABN AMRO CORPORATE FINANCE LIMITED"

Faker::Bank.routing_number #=> "729343831"

Faker::Bank.swift_bic #=> "AAFMGB21"    
```
