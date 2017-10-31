# Faker::Stripe

### Test Stripe transactions without hardcoding card numbers and tokens


```ruby
Faker::Stripe.valid_card #=> 4242424242424242

Faker::Stripe.valid_card("visa_debit") #=> 4000056655665556

Faker::Stripe.invalid_card #=> 4000000000000002

Faker::Stripe.invalid_card("addressZipFail") #=> 4000000000000010

Faker::Stripe.valid_card_object #=>  {type:   "american express",
                                #     number: "378282246310005",
                                #     exp_mo: 10,
                                #     exp_yr: 2018,
                                #     ccv:    1234}
```

ProTip:
Use some of the other handy Faker classes for Stripe charge amounts and email.

```ruby
Faker::Number.between(3,10) #=> 100

Faker::Internet.free_email #=> "freddy@gmail.com"
```
