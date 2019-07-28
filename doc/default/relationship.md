# Faker::Relationship
### A Faker module for familial relationships.

```ruby
Faker::Relationship.familial #=> "Mother" or "Grandmother"

Faker::Relationship.familial(connection: 'direct') #=> "Mother" or "Brother"

Faker::Relationship.familial(connection: 'extended') #=> "Grandmother" or "Niece" or "Aunt"

Faker::Relationship.spouse #=> "Husband" or "Wife"

Faker::Relationship.parent #=> "Father" or "Mother"

Faker::Relationship.in_law #=> "Father-in-law"

Faker::Relationship.sibling #=> "Sister" or "Brother"
```
