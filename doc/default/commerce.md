# Faker::Commerce

```ruby
Faker::Commerce.color #=> "lavender"

# Keyword arguments: max, fixed_amount
Faker::Commerce.department #=> "Grocery, Health & Beauty"
Faker::Commerce.department(max: 5) #=> "Grocery, Books, Health & Beauty"
Faker::Commerce.department(max: 2, fixed_amount: true) #=> "Books & Tools"

Faker::Commerce.material #=> "Plastic"

Faker::Commerce.product_name #=> "Practical Granite Shirt"

# Produces a Float by default
# Keyword arguments: range, as_string
Faker::Commerce.price #=> 44.6
Faker::Commerce.price(range: 0..10.0, as_string: true) #=> "2.18"

# Generate a random promotion code.
# Keyword arguments: digits
Faker::Commerce.promotion_code #=> "AmazingDeal829102"
Faker::Commerce.promotion_code(digits: 2) #=> "AmazingPrice57"
```
