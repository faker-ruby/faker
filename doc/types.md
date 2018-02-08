# Faker::Types

```ruby
# Random String created from word (Faker::Lorem.word)
Faker::Types.string #=> "foobar"

# Random Character a-z, 0-9
Faker::Types.character #=> "n"

# Random Integer
Faker::Types.integer #=> 1

# Random Hash (with random keys and values)
Faker::Types.hash #=> {name: "bob"}

# Random Complex Hash (values include other hashes and arrays) 
Faker::Types.complex_hash #=> {user: {first: "bob", last: "marley"}}

# Random Array
Faker::Types.array #=> ["a", 1, 2, "bob"]

# Random Type (string, or integer)
Faker::Types.random_type #=> 1 or "a" or "bob"

# Random Complex Type (string, integer, array, or hash)
Faker::Types.random_complex_type #=> 1 or "a" or "bob" or {foo: "bar"}
```
