# Faker::Bank
```ruby

Faker::Bank.account_number #=> 6738582379

Faker::Bank.routing_number #=> "729343831"

Faker::Bank.name #=> "ABN AMRO CORPORATE FINANCE LIMITED"

Faker::Bank.swift_bic #=> "AAFMGB21"    

Faker::Bank.iban #=> "GB76DZJM33188515981979"

# Optional argument bank_country_code
# All countries should be supported
Faker::Bank.iban("be") #=> "BE6375388567752043"
```
