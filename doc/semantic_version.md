# Faker::SemanticVersion

```ruby
# Random semantic version
Faker::SemanticVersion.version #=> "2.3.13"

# Random semantic version with a specified major 
Faker::SemanticVersion.version(10) #=> "10.4.1"

# Random semantic version with a specified major and minor
Faker::SemanticVersion.version(1,5) #=> "1.5.19"

# Random semantic version with a specified major, minor, and patch
Faker::SemanticVersion.version(1,5,9) #=> "1.5.9"

# Random semantic version with a specified major, patch, and include metadata
Faker::SemanticVersion.version(0,nil,9,true) #=> "0.9.9-alpha-4132"

```
