# Faker::Creature::Bird

```ruby
# Random common family name of a bird
Faker::Creature::Bird.common_family_name #=> "Owls"

# Random taxonomic order from the class Aves (ie. those are birds)
Faker::Creature::Bird.order #=> "Passeriformes" # Fun fact, 60% of birds are Passeriformes!

# Random bird anatomy word
Faker::Creature::Bird.anatomy #=> "rump"

# Random bird anatomy word, in the past tense
Faker::Creature::Bird.anatomy_past_tense #=> "breasted"

# Random bird geography word
Faker::Creature::Bird.geo #=> "Eurasian"

# Random bird color word
Faker::Creature::Bird.color #=> "ferruginous"

# Random bird adjective word
Faker::Creature::Bird.adjective #=> "common"

# Random emotional adjective NOT typically used in bird names
Faker::Creature::Bird.emotional_adjective #=> "cantankerous"

# Random silly adjective NOT used in bird names
Faker::Creature::Bird.silly_adjective #=> "drunk"

# Random common name for a bird
Faker::Creature::Bird.common_name #=> 'wren'

# Random plausible common name for a bird
Faker::Creature::Bird.plausible_common_name #=> 'Hellinger's Wren'

# Random implausible common name for a bird
Faker::Creature::Bird.implausible_common_name #=> 'Hellinger's Cantankerous Chickadee'

# Returns a random pair order / common name pair
Faker::Creature::Bird.order_with_common_name #=> {:order=>"Coliiformes", :common_name=>"Mousebird"}
```
