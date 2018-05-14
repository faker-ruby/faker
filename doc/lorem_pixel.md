# Faker::LoremPixel

```ruby
Faker::LoremPixel.image #=> "https://lorempixel.com/300/300"

Faker::LoremPixel.image("50x60") #=> "https://lorempixel.com/50/60"

Faker::LoremPixel.image("50x60", true) #=> "https://lorempixel.com/g/50/60"

Faker::LoremPixel.image("50x60", false, 'sports') #=> "https://lorempixel.com/50/60/sports"

Faker::LoremPixel.image("50x60", false, 'sports', 3) #=> "https://lorempixel.com/50/60/sports/3"

Faker::LoremPixel.image("50x60", false, 'sports', 3, 'Dummy-text') #=> "https://lorempixel.com/50/60/sports/3/Dummy-text"

Faker::LoremPixel.image("50x60", false, 'sports', nil, 'Dummy-text') #=> "https://lorempixel.com/50/60/sports/Dummy-text"

Faker::LoremPixel.image(secure: false) #=> "http://lorempixel.com/300/300"
```
