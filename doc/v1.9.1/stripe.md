# Faker::Stripe

Test Stripe transactions without hardcoding card numbers and tokens

```ruby
Faker::Stripe.valid_card #=> "4242424242424242"

Faker::Stripe.valid_card("visa_debit") #=> "4000056655665556"

Faker::Stripe.valid_token #=> "tok_visa"

Faker::Stripe.valid_token("mc_debit") #=> "tok_mastercard_debit"

Faker::Stripe.invalid_card #=> "4000000000000002"

Faker::Stripe.invalid_card("addressZipFail") #=> "4000000000000010"

Faker::Stripe.month #=> "10"

Faker::Stripe.year #=> "2018" # This will always be a year in the future

Faker::Stripe.ccv #=> "123"

Faker::Stripe.ccv("amex") #=> "1234"
```

ProTip:
Use some of the other handy Faker classes for Stripe charge amounts and email.

```ruby
Faker::Number.between(3,10) #=> 100

Faker::Internet.free_email #=> "freddy@gmail.com"
```
