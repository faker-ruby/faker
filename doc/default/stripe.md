# Faker::Stripe

Test Stripe transactions without hardcoding tokens

```ruby
# Keyword arguments: card_type
Faker::Stripe.valid_token #=> "tok_visa"
Faker::Stripe.valid_token(card_type: "mc_debit") #=> "tok_mastercard_debit"
```

ProTip:
Use some of the other handy Faker classes for Stripe charge amounts and email.

```ruby
# Keyword arguments: from, to
Faker::Number.between(from: 3, to: 10) #=> 100

Faker::Internet.free_email #=> "freddy@gmail.com"
```
