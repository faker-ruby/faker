# Faker::Types

```ruby
# Random String created from word (Faker::Lorem.word)
Faker::Types.rb_string #=> "foobar"

# Random Character a-z, 0-9
Faker::Types.character #=> "n"

# Random Integer
Faker::Types.rb_integer #=> 1

# Random Hash (with random keys and values)
# Keyword arguments: number
Faker::Types.rb_hash #=> {name: "bob"}
Faker::Types.rb_hash(number: 1) #=> {name: "bob"}
Faker::Types.rb_hash(number: 2) #=> {name: "bob", last: "marley"}

# Random Complex Hash (values include other hashes and arrays)
# Keyword arguments: number
Faker::Types.complex_rb_hash #=> {user: {first: "bob", last: "marley"}}
Faker::Types.complex_rb_hash(number: 1) #=> {user: {first: "bob", last: "marley"}}
Faker::Types.complex_rb_hash(number: 2) #=> {user: {first: "bob", last: "marley"}, son: ["damien", "marley"]}

# Random Array
Faker::Types.rb_array #=> ["a"]
Faker::Types.rb_array(len: 4) #=> ["a", 1, 2, "bob"]
Faker::Types.rb_array(len: 2, type: -> { Faker::Types.rb_string }) #=> ["cat", "foo"]

# Random Type (string, or integer)
Faker::Types.random_type #=> 1 or "a" or "bob"

# Random Complex Type (string, integer, array, or hash)
Faker::Types.random_complex_type #=> 1 or "a" or "bob" or {foo: "bar"}
```
