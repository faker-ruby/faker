# Faker::Sports

## Conventional (Olympic including Paralympic) Sports

```ruby
# Any one of the below four categories:
Faker::Sports.sport #=> "Snowboard"

Faker::Sports.summer_olympics_sport #=> "Triathlon"

Faker::Sports.winter_olympics_sport #=> "Luge"

Faker::Sports.summer_paralympics_sport #=> "Goalball"

Faker::Sports.winter_paralympics_sport #=> "Wheelchair curling"
```

## Ancient Sports

```ruby
Faker::Sports.ancient_olympics_sport #=> "Chariot racing"

# Any modern or ancient olympic sport:
Faker::Sports.sport(include_ancient: true) #=> "Rugby"
```

## Unusual Sports (just for fun)

```ruby
Faker::Sports.unusual_sport #=> "Camel wrestling"

# Any modern olympic or unusual sport:
Faker::Sports.sport(include_unusual: true) #=> "Gurning"
```

## Full list

```ruby
# Modern, ancient or unusual:
Faker::Sports.sport(include_ancient: true, include_unusual: true) #=> "Powerlifting"
```
