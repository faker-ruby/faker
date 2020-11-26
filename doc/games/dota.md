# Faker::Games::Dota

Available since version 1.9.0.

```ruby
# Random hero
Faker::Games::Dota.hero #=> "Abaddon"

# Random item
Faker::Games::Dota.item #=> "Armlet of Mordiggian"

# Random team
Faker::Games::Dota.team #=> "Evil Geniuses"

# Random player
Faker::Games::Dota.player #=> "Dendi"

# Random quote
# by default if you don't pass the hero parameter, the quote method will set hero as 'abbadon'
Faker::Games::Dota.quote #=> "You have called death upon yourself."
Faker::Games::Dota.quote(hero: 'alchemist') #=> "Better living through alchemy!"
```

Available since version next

```ruby
# Random neutral item
Faker::Games::Dota.neutral_item #=> "Royal Jelly"
```