# Faker::Commerce

```ruby
Faker::Commerce.color #=> "lavender"

# Keyword arguments max: 3, fixed_amount: false
Faker::Commerce.department #=> "Grocery, Health & Beauty"
Faker::Commerce.department(max: 5) #=> "Grocery, Books, Health & Beauty"
Faker::Commerce.department(max: 2, fixed_amount: true) #=> "Books & Tools"

Faker::Commerce.material #=> "Steel"

Faker::Commerce.product_name #=> "Practical Granite Shirt"

# Produces a Float by default
Faker::Commerce.price #=> 44.6
Faker::Commerce.price(range: 0..10.0, as_string: true) #=> "2.18"

# Generate a random promotion code.
# Keyword argument digits: 6 for number of random digits in suffix
Faker::Commerce.promotion_code #=> "AmazingDeal829102"
Faker::Commerce.promotion_code(digits: 2) #=> "AmazingPrice57"

Faker::Commerce.material #=> "Plastic"
```
