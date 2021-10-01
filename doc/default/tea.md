# Faker::Tea

Available since version next.

```ruby
# Get a tea variety
Faker::Tea.variety # => "Earl Grey"

# Get a tea variety, by type of tea. Accepted types:
# ['Black', 'Green', 'Herbal', 'Oolong', 'White']
Faker::Tea.variety(type: 'Green') #=> "Jasmine"

# Get a type of tea
Faker::Tea.type #=> "Herbal"
```
