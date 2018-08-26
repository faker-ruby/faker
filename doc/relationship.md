# Faker::Relationship
### A Faker module for familial relationships.

```ruby
Faker::Relationship.familial #=> "Mother" or "Grandmother"

Faker::Relationship.familial('direct') #=> "Mother" or "Brother"

Faker::Relationship.familial('extended') #=> "Grandmother" or "Niece" or "Aunt"

Faker::Relationship.spouse #=> "Husband" or "Wife"

Faker::Relationship.parent #=> "Father" of "Mother"

Faker::Relationship.in_law #=> "Father-in-law"

Faker::Relationship.sibling #=> "Sister" of "Brother"
```
