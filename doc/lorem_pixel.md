# Faker::LoremPixel

```ruby
Faker::LoremPixel.image #=> "http://lorempixel.com/300/300"

Faker::LoremPixel.image("50x60") #=> "http://lorempixel.com/50/60"

Faker::LoremPixel.image("50x60", true) #=> "http://lorempixel.com/g/50/60"

Faker::LoremPixel.image("50x60", false, 'sports') #=> "http://lorempixel.com/50/60/sports"

Faker::LoremPixel.image("50x60", false, 'sports', 3) #=> "http://lorempixel.com/50/60/sports/3"

Faker::LoremPixel.image("50x60", false, 'sports', 3, 'Dummy-text') #=> "http://lorempixel.com/50/60/sports/3/Dummy-text"

Faker::LoremPixel.image("50x60", false, 'sports', nil, 'Dummy-text') #=> "http://lorempixel.com/50/60/sports/Dummy-text"
```
