# Faker::Measurement

# For each, if you don't pass in an integer or float, it randomly selects an integer between 1 and 10.
# If you pass in "none", it returns the singular version of the measurement unit, without a number.
# If you pass in "all", it returns the plural version of the measurement unit, without a number.

```ruby
Faker::Measurement.height #=> "6 inches"

Faker::Measurement.height(1.4) #=> "1.4 inches"

Faker::Measurement.height_none #=> "inch"

Faker::Measurement.height_all #=> "inches"

Faker::Measurement.length #=> "1 yard"

Faker::Measurement.length_none #=> "yard"

Faker::Measurement.length_all #=> "yards"

Faker::Measurement.volume #=> "10 cups"

Faker::Measurement.volume_none #=> "cup"

Faker::Measurement.volume_all #=> "cups"

Faker::Measurement.weight #=> "3 pounds"

Faker::Measurement.weight_none #=> "pound"

Faker::Measurement.weight_all #=> "pounds"

Faker::Measurement.metric_height #=> "2 meters"

Faker::Measurement.metric_height_none #=> "meter"

Faker::Measurement.metric_height_all #=> "meters"

Faker::Measurement.metric_length #=> "0 decimeters"

Faker::Measurement.metric_length_none #=> "decimeter"

Faker::Measurement.metric_length_all #=> "decimeters"

Faker::Measurement.metric_volume #=> "1 liter"

Faker::Measurement.metric_volume_none #=> "liter"

Faker::Measurement.metric_volume_all #=> "liters"

Faker::Measurement.metric_weight #=> "8 grams"

Faker::Measurement.metric_weight_none #=> "gram"

Faker::Measurement.metric_weight_all #=> "grams"
```
