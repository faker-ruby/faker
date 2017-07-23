# Faker::Compass

```ruby
# A random direction
Faker::Compass.direction                 #=> "southeast"
## Count ##
# de: 4 # en: 4 
Faker::Compass.cardinal                  #=> "north"
## Count ##
# de: dynamic # en: dynamic 
Faker::Compass.ordinal                   #=> "northwest"
## Count ##
# de: dynamic # en: dynamic 
Faker::Compass.half_wind                 #=> "north-northwest"
Faker::Compass.quarter_wind              #=> "north by west"

# Random abbreviation
Faker::Compass.abbreviation              #=> "NEbN"
## Count ##
# de: 4 # en: 4 
Faker::Compass.cardinal_abbreviation     #=>    "N"
Faker::Compass.ordinal_abbreviation      #=>   "SW"
Faker::Compass.half_wind_abbreviation    #=>  "NNE"
Faker::Compass.quarter_wind_abbreviation #=> "SWbS"

# Random azimuth
Faker::Compass.azimuth                   #=> "168.75"
## Count ##
# de: 4 # en: 4 
Faker::Compass.cardinal_azimuth          #=>     "90"
Faker::Compass.ordinal_azimuth           #=>    "135"
Faker::Compass.half_wind_azimuth         #=>  "292.5"
Faker::Compass.quarter_wind_azimuth      #=>  "56.25"
```
