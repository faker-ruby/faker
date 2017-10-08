# Faker::Measurement

# For each, if you don't pass in an integer or float, it randomly selects an integer between 1 and 10.
# If you pass in "none", it returns the singular version of the measurement unit, without a number.
# If you pass in "all", it returns the plural version of the measurement unit, without a number.

```ruby
Faker::Measurement.height #=> "6 inches"
## Count ##
# en: 2 

Faker::Measurement.height(1.4) #=> "1.4 inches"

Faker::Measurement.height("none") #=> "inch"

Faker::Measurement.height("all") #=> "inches"

Faker::Measurement.length #=> "1 yard"
## Count ##
# en: 3 

Faker::Measurement.volume #=> "10 cups"
## Count ##
# en: 7 

Faker::Measurement.weight #=> "3 pounds"
## Count ##
# en: 3 

Faker::Measurement.metric_height #=> "2 meters"
## Count ##
# en: 2 

Faker::Measurement.metric_length #=> "0 decimeters"
## Count ##
# en: 7 

Faker::Measurement.metric_volume #=> "1 liter"
## Count ##
# en: 2 

Faker::Measurement.metric_weight #=> "8 grams"
## Count ##
# en: 8 
```
