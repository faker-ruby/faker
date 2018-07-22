# Faker::App

Available since version 1.4.3.

```ruby
Faker::App.name #=> "Treeflex"

Faker::App.version #=> "1.85"

Faker::App.author #=> "Daphne Swift"

Faker::App.semantic_version #=> "3.2.5"

Faker::App.semantic_version(major: 42) #=> "42.5.2"

Faker::App.semantic_version(minor: 100..101) #=> "42.100.4"

Faker::App.semantic_version(patch: 5..6) #=> "7.2.6"
```
