# Faker::Number

```ruby
# Produces a number of the specified digits where the leading digit is never 0
# Keyword arguments: digits
Faker::Number.number(digits: 10) #=> 1968353479

# Produces a number of the specified digits with a leading zero
# Keyword arguments: digits
Faker::Number.leading_zero_number(digits: 10) #=> "0669336915"

# Produces a 2-digit number, preserves leading 0's
# Keyword arguments: digits
Faker::Number.decimal_part(digits: 2) #=> "09"

# Produces a number with 2 digits leading and trailing the decimal
# Keyword arguments: l_digits
Faker::Number.decimal(l_digits: 2) #=> 11.88

# Specify different values for leading and trailing digits
# Keyword arguments: l_digits, r_digits
Faker::Number.decimal(l_digits: 3, r_digits: 3) #=> 181.843

# Keyword arguments: mean, standard_deviation
Faker::Number.normal(mean: 50, standard_deviation: 3.5) #=> 47.14669604069156

# Keyword arguments: digits
Faker::Number.hexadecimal(digits: 3) #=> "e74"

# Keyword arguments: digits
Faker::Number.binary(digits: 4) #=> "1010"

# Boundary numbers are inclusive
# Keyword arguments: from, to
Faker::Number.between(from: 1, to: 10) #=> 7
Faker::Number.between(from: 0.0, to: 1.0) #=> 0.7844640543957383

# Min and Max boundaries of range are inclusive
# Keyword arguments: range
Faker::Number.within(range: 1..10) #=> 7
Faker::Number.within(range: 0.0..1.0) #=> 0.7844640543957383

Faker::Number.positive #=> 235.59238499107653

Faker::Number.negative #=> -4480.042585669558

Faker::Number.non_zero_digit #=> 8

Faker::Number.digit #=> 1
```
