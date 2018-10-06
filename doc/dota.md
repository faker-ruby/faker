# Faker::Dota

Available since version 1.9.0.

```ruby
# Random hero
Faker::Dota.hero #=> "Abaddon"

# Random item
Faker::Dota.item #=> "You have called death upon yourself."

# Random team
Faker::Dota.team #=> "Evil Geniuses"

# Random player
Faker::Dota.player #=> "Dendi"

# Random quote
Faker::Dota.quote #=> "Easy now, this stuff is explosive!"
Faker::Dota.quote(hero = 'alchemist') #=> "Better living through alchemy!"
```