# Faker::Business

```ruby
Faker::Business.credit_card_expiry_date #=> <Date: 2015-11-11 ((2457338j,0s,0n),+0s,2299161j)>

Faker::Business.card_brand #=> "visa"

Faker::Business.card_type #=> "visa_debit"

# Keyword arguments: card_type
Faker::Business.valid_card_number #=> "4242424242424242"
Faker::Business.valid_card_number(card_type: "visa_debit") #=> "4000056655665556"

# Keyword arguments: card_error
Faker::Business.invalid_card_number #=> "4000000000000002"
Faker::Business.invalid_card_number(card_error: "addressZipFail") #=> "4000000000000010"

Faker::Business.card_expiry_month #=> "10"

Faker::Business.card_expiry_year #=> "2023" # This will always be a year in the future

# Keyword arguments: card_type
Faker::Business.ccv #=> "123"
Faker::Business.ccv(card_type: "amex") #=> "1234"
```
