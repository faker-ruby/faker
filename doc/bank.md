# Faker::Bank
```ruby
Faker::Bank.name #=> "ABN AMRO CORPORATE FINANCE LIMITED"

Faker::Bank.swift_bic #=> "AAFMGB21"    

Faker::Bank.iban #=> "GB76DZJM33188515981979"

# Optional argument bank_country_code(EU only)
Faker::Bank.iban("be") #=> "BE6375388567752043"
```
