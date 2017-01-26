# Faker::Money

```ruby
# Optional arguments) min=0, max=100, decimal_place=2
Faker::Money.money #=> 39.41
Faker::Money.money(100, 500, 1) #=> 253.8


# Optional arguments)  min=0, max=100, decimal_place=2
# (If it has only one decimal place, append '0' to the end.)
Faker::Money.money_with_zero_padding #=> "78.20"
Faker::Money.money_with_zero_padding(100, 900, 1) #=> "162.0"


# Optional arguments)  min=0, max=100, decimal_place=2
Faker::Money.money_with_symbol #=> "$78.20"
# (If locale is "en-GB")
Faker::Config.locale = "en-GB"
Faker::Money.money_with_symbol #=> "£78.20"


# Optional arguments)  min=0, max=100
Faker::Money.money_without_cents #=> 78


# Optional arguments)  min=0, max=100
Faker::Money.money_without_cents_with_symbol #=> "$78"
# (If locale is "en-GB")
Faker::Config.locale = "en-GB"
Faker::Money.money_without_cents_with_symbol #=> "£78"
```
