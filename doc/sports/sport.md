# Faker::Sport

## Conventional (Olympic including Paralympic) Sports

```ruby
# Any one of the below four categories:
Faker::Sport.sport #=> "Snowboard"

Faker::Sport.summer_olympics_sport #=> "Triathlon"

Faker::Sport.winter_olympics_sport #=> "Luge"

Faker::Sport.summer_paralympics_sport #=> "Goalball"

Faker::Sport.winter_paralympics_sport #=> "Wheelchair curling"
```

## Ancient Sports

```ruby
Faker::Sport.ancient_olympics_sport #=> "Chariot racing"

# Any modern or ancient olympic sport:
Faker::Sport.sport(include_ancient: true) #=> "Rugby"
```

## Unusual Sports (just for fun)

```ruby
Faker::Sport.unusual_sport #=> "Camel wrestling"

# Any modern olympic or unusual sport:
Faker::Sport.sport(include_unusual: true) #=> "Gurning"
```

## Full list

```ruby
# Modern, ancient or unusual:
Faker::Sport.sport(include_ancient: true, include_unusual: true) #=> "Powerlifting"
```
