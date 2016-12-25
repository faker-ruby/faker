# Faker::Number

```ruby
# Required parameter: digits
Faker::Number.number(10) #=> "1968353479"

# Required parameter: l_digits
Faker::Number.decimal(2) #=> "11.88"

Faker::Number.decimal(2, 3) #=> "18.843"

# Required parameters: mean, standard_deviation
Faker::Number.normal(50, 3.5) #=> 47.14669604069156

# Required parameter: digits
Faker::Number.hexadecimal(3) #=> "e74"

Faker::Number.between(1, 10) #=> 7

Faker::Number.positive #=> 235.59238499107653

Faker::Number.negative #=> -4480.042585669558

Faker::Number.digit #=> "1"
```
