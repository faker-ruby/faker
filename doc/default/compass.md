# Faker::Compass

Available since version 1.8.0.

```ruby
# A random direction
Faker::Compass.direction                 #=> "southeast"

# Random cardinal
Faker::Compass.cardinal                  #=> "north"

# Random ordinal
Faker::Compass.ordinal                   #=> "northwest"

# Random half_wind
Faker::Compass.half_wind                 #=> "north-northwest"

# Random quarter wind
Faker::Compass.quarter_wind              #=> "north by west"

# Random abbreviation
Faker::Compass.abbreviation              #=> "NEbN"

# Random cardinal abbreviation
Faker::Compass.cardinal_abbreviation     #=>    "N"

# Random ordinal abbreviation
Faker::Compass.ordinal_abbreviation      #=>   "SW"

# Random half wind abbreviation
Faker::Compass.half_wind_abbreviation    #=>  "NNE"

# Random quarter wind abbreviation
Faker::Compass.quarter_wind_abbreviation #=> "SWbS"

# Random azimuth
Faker::Compass.azimuth                   #=> "168.75"

# Random cardinal azimuth
Faker::Compass.cardinal_azimuth          #=>     "90"

# Random ordinal azimuth
Faker::Compass.ordinal_azimuth           #=>    "135"

# Random half wind azimuth
Faker::Compass.half_wind_azimuth         #=>  "292.5"

# Random quarter wind azimuth
Faker::Compass.quarter_wind_azimuth      #=>  "56.25"
```
