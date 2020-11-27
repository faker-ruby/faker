# Faker::Books::Dune

### A Faker module beyond your dreams, test data beyond your imagination.

```ruby
Faker::Books::Dune.character #=> "Leto Atreides"

Faker::Books::Dune.title #=> "Duke"

Faker::Books::Dune.planet #=> "Caladan"

Faker::Books::Dune.city #=> "Arrakeenn"

Faker::Books::Dune.quote #=> "A dead man, surely, no longer requires that water."

# Keyword arguments: character
Faker::Books::Dune.quote(character: "baron_harkonnen") #=> "He who controls the spice, controls the universe!"

Faker::Books::Dune.saying #=> "You do not beg the sun for mercy."

# Keyword arguments: source
Faker::Books::Dune.saying(source: "fremen") #=> "May thy knife chip and shatter."
```
