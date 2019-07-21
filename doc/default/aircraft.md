# Faker::Aircraft

``ruby
# Generate random aircraft manufacturers
Faker::Aircraft.manufacturer #=> "Airbus"

# Generate random aircraft models by manufacturer
#
# @param [String] manufacturer_of_model The specific manufacturer
# Uses a random manufacturer if not provided
Faker::Aircraft.model #=> "A380"
Faker::Aircraft.model(manufacturer_of_model = "Boeing") #=> "787"

# Generate random aircraft prefix
Faker::Aircraft.prefix #=> N12345AZ

# Generate a random airline
Faker::Aircraft.airline #=> "Sunrise Airways"
```
