# Faker::Demographic

Available since version 1.7.3.

```ruby
Faker::Demographic.race #=> "Native Hawaiian or Other Pacific Islander"

Faker::Demographic.educational_attainment #=> "GED or alternative credential"

Faker::Demographic.demonym #=> "Panamanian"

Faker::Demographic.marital_status #=> "Widowed"

Faker::Demographic.sex #=> "Female"

Faker::Demographic.height #=> "1.61"

# Keyword arguments: unit
Faker::Demographic.height(unit: :imperial) #=> "6 ft, 2 in"
```
