# Faker::Commerce

```ruby
Faker::Commerce.color #=> "lavender"
## Count ##
# da-DK: 12 # ru: 31 # sv: 15 # uk: 114 

# Optional arguments max=3, fixed_amount=false
Faker::Commerce.department #=> "Grocery, Health & Beauty"
## Count ##
# da-DK: 17 # de: 22 # en: 22 # ru: 21 # sv: 17 # uk: 21 
Faker::Commerce.department(5) #=> "Grocery, Books, Health & Beauty"
Faker::Commerce.department(2, true) #=> "Books & Tools"

Faker::Commerce.product_name #=> "Practical Granite Shirt"
## Count ##
# da-DK: dynamic # de: dynamic # en: dynamic # ru: dynamic # sv: dynamic # uk: dynamic 

Faker::Commerce.price #=> "44.6"

# Generate a random promotion code.
# Optional argument digits = 6 for number of random digits in suffix
Faker::Commerce.promotion_code #=> "AmazingDeal829102"
## Count ##
# en: dynamic 

Faker::Commerce.material #=> "Plastic"
```
