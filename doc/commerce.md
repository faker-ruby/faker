# Faker::Commerce

```ruby
Faker::Commerce.color #=> "lavender"

# Optional arguments max=3, fixed_amount=false
Faker::Commerce.department #=> "Grocery, Health & Beauty"
Faker::Commerce.department(5) #=> "Grocery, Books, Health & Beauty"
Faker::Commerce.department(2, true) #=> "Books & Tools"

Faker::Commerce.material #=> "Steel"

Faker::Commerce.product_name #=> "Practical Granite Shirt"

# Produces a Float by default
Faker::Commerce.price #=> 44.6 
Faker::Commerce.price(range = 0..10.0, as_string = true) #=> "2.18"

# Generate a random promotion code.
# Optional argument digits = 6 for number of random digits in suffix
Faker::Commerce.promotion_code #=> "AmazingDeal829102"
Faker::Commerce.promotion_code(digits = 2) #=> "AmazingPrice57"

Faker::Commerce.material #=> "Plastic"
```
