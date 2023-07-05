# Faker::Composite

```ruby
composite_faker = Faker::Composite.new(Faker::Creature::Dog, Faker::Bank, Faker::Games::Pokemon)

composite_faker.name #=> "Swedish Krona"

# Only methods common to all generator can be called as part of composite generator
composite_faker.account_number #=> NoMethodError
```
