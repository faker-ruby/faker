# Faker::Dota

It might be available in the next version.

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