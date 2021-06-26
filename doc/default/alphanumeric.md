# Faker::Alphanumeric

```ruby
# Keyword arguments: number
Faker::Alphanumeric.alpha(number: 10) #=> "zlvubkrwga"

# Keyword arguments: number, min_alpha, min_numeric
Faker::Alphanumeric.alphanumeric(number: 10) #=> "3yfq2phxtb"
Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3) #=> "3yfq2phxtb"
Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3) #=> "3yfq2phx8b"
```
