# Faker::ChileRUT

```ruby
Faker::ChileRUT.full_RUT #=> "30686957-4"

# Returns RUT between 1 (default param) and 99999999
Faker::ChileRUT.RUT #=> 11235813

# Returns RUT between passed minimum RUT and 99999999
Faker::ChileRUT.RUT(20_890_156) #=> 31853211

# Every call to RUT or full_RUT generates a new random RUT, so last_RUT and dv allows you to get the separated parts of the full RUT without losing the already generated RUT
Faker::ChileRUT.RUT #=> 23567131
Faker::ChileRUT.last_RUT #=> 23567131
Faker::ChileRUT.dv #=> "k"

# check_digit is an alias for dv, for English speaking devs
Faker::ChileRUT.RUT #=> 30528772
Faker::ChileRUT.check_digit #=> "5"
```
