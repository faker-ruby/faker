# Faker::Compass

```ruby
# A random direction
Faker::Compass.direction                 #=> "southeast"
Faker::Compass.cardinal                  #=> "north"
Faker::Compass.ordinal                   #=> "northwest"
Faker::Compass.half_wind                 #=> "north-northwest"
Faker::Compass.quarter_wind              #=> "north by west"

# Random abbreviation
Faker::Compass.abbreviation              #=> "NEbN"
Faker::Compass.cardinal_abbreviation     #=>    "N"
Faker::Compass.ordinal_abbreviation      #=>   "SW"
Faker::Compass.half_wind_abbreviation    #=>  "NNE"
Faker::Compass.quarter_wind_abbreviation #=> "SWbS"

# Random azimuth
Faker::Compass.azimuth                   #=> "168.75"
Faker::Compass.cardinal_azimuth          #=>     "90"
Faker::Compass.ordinal_azimuth           #=>    "135"
Faker::Compass.half_wind_azimuth         #=>  "292.5"
Faker::Compass.quarter_wind_azimuth      #=>  "56.25"
```
