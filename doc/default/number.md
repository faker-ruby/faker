# Faker::Number

```ruby
# Required parameter: digits
# Produces a number of the specified digits where the leading digit is never 0
Faker::Number.number(digits: 10) #=> 1968353479

# Required parameter: digits
# Produces a number of the specified digits with a leading zero
Faker::Number.leading_zero_number(digits: 10) #=> "0669336915"

# Required parameter: digits
# Produces a 2-digit number, preserves leading 0's
Faker::Number.decimal_part(digits: 2) #=> "09"

# Required parameter: l_digits
# Produces a number with 2 digits leading and trailing the decimal
Faker::Number.decimal(l_digits: 2) #=> 11.88

# Specify different values for leading and trailing digits
Faker::Number.decimal(l_digits: 3, r_digits: 3) #=> 181.843

# Required parameters: mean, standard_deviation
Faker::Number.normal(mean: 50, standard_deviation: 3.5) #=> 47.14669604069156

# Required parameter: digits
Faker::Number.hexadecimal(digits: 3) #=> "e74"

# Required parameters: minimum value, maximum value
# Boundary numbers are inclusive
Faker::Number.between(from: 1, to: 10) #=> 7

# Required parameters: a range value
# Min and Max boundaries of range are inclusive
Faker::Number.within(range: 1..10) #=> 7

Faker::Number.positive #=> 235.59238499107653

Faker::Number.negative #=> -4480.042585669558

Faker::Number.non_zero_digit #=> 8

Faker::Number.digit #=> 1
```
