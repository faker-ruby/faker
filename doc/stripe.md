# Faker::Stripe

### Test Stripe transactions without hardcoding card numbers and tokens


```ruby
Faker::Stripe.valid_card #=> "4242424242424242"

Faker::Stripe.valid_card("visa_debit") #=> "4000056655665556"

Faker::Stripe.valid_us_token #=> "tok_mastercard"

Faker::Stripe.card_error #=> "4000000000000002"

```

ProTip:

For Stripe charge amount and email:

```ruby
Faker::Number.between(3,10) #=> 100

Faker::Internet.free_email #=> "freddy@gmail.com"
```
