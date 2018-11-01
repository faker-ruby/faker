# Faker::Games::Dota

Available since version 1.9.0.

```ruby
# Random hero
Faker::Games::Dota.hero #=> "Abaddon"

# Random item
Faker::Games::Dota.item #=> "You have called death upon yourself."

# Random team
Faker::Games::Dota.team #=> "Evil Geniuses"

# Random player
Faker::Games::Dota.player #=> "Dendi"

# Random quote
# by default if you don't pass the hero parameter, the quote method will set hero as 'abbadon'
Faker::Games::Dota.quote #=> "Easy now, this stuff is explosive!"
Faker::Games::Dota.quote(hero: 'alchemist') #=> "Better living through alchemy!"
```
