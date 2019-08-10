# Faker::ChileRut

```ruby
Faker::ChileRut.full_rut #=> "30686957-4"

# Returns rut between 1 (default param) and 99999999
Faker::ChileRut.rut #=> 11235813

# Returns rut between passed minimum rut and 99999999
# Keyword arguments: min_rut
Faker::ChileRut.rut(min_rut: 20_890_156) #=> 31853211

# Every call to rut or full_rut generates a new random rut, so last_rut and dv
# allows you to get the separated parts of the full rut without losing the already generated rut
Faker::ChileRut.rut #=> 23567131
Faker::ChileRut.last_rut #=> 23567131
Faker::ChileRut.dv #=> "k"

# check_digit is an alias for dv, for English speaking devs
Faker::ChileRut.rut #=> 30528772
Faker::ChileRut.check_digit #=> "5"
```
