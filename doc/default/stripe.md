# Faker::Stripe

Test Stripe transactions without hardcoding card numbers and tokens

```ruby
# Keyword arguments: card_type
Faker::Stripe.valid_card #=> "4242424242424242"
Faker::Stripe.valid_card(card_type: "visa_debit") #=> "4000056655665556"

# Keyword arguments: card_type
Faker::Stripe.valid_token #=> "tok_visa"
Faker::Stripe.valid_token(card_type: "mc_debit") #=> "tok_mastercard_debit"

# Keyword arguments: card_error
Faker::Stripe.invalid_card #=> "4000000000000002"
Faker::Stripe.invalid_card(card_error: "addressZipFail") #=> "4000000000000010"

Faker::Stripe.month #=> "10"

Faker::Stripe.year #=> "2018" # This will always be a year in the future

# Keyword arguments: card_type
Faker::Stripe.ccv #=> "123"
Faker::Stripe.ccv(card_type: "amex") #=> "1234"
```

ProTip:
Use some of the other handy Faker classes for Stripe charge amounts and email.

```ruby
# Keyword arguments: from, to
Faker::Number.between(from: 3, to: 10) #=> 100

Faker::Internet.free_email #=> "freddy@gmail.com"
```
