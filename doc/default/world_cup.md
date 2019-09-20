# Faker::WorldCup

Available since version 1.9.0.

```ruby
Faker::WorldCup.team #=> "South Korea"

Faker::WorldCup.stadium #=> "Ekaterinburg Arena"

Faker::WorldCup.city #=> "Saint Petersburg"

# Keyword arguments: group
Faker::WorldCup.group #=> "Egypt"
Faker::WorldCup.group(group: 'group_A') #=> "Saudi Arabia"

# Keyword arguments: country, type
Faker::WorldCup.roster #=> "Héctor Cúper"
Faker::WorldCup.roster(country: 'Russia', type: 'coach') #=> "Stanislav Cherchesov"
```
