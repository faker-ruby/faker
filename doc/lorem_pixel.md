# Faker::LoremPixel

```ruby
Faker::LoremPixel.image #=> "http://lorempixel.com/300/300"

Faker::LoremPixel.image(size: "50x60") #=> "http://lorempixel.com/50/60"

Faker::LoremPixel.image(size: "50x60", grayscale: true) #=> "http://lorempixel.com/g/50/60"

Faker::LoremPixel.image(size: "50x60", category: 'sports') #=> "http://lorempixel.com/50/60/sports"

Faker::LoremPixel.image(size: "50x60", category: 'sports', id: 3) #=> "http://lorempixel.com/50/60/sports/3"

Faker::LoremPixel.image(size: "50x60", category: 'sports', id: 3, text: 'Dummy-text') #=> "http://lorempixel.com/50/60/sports/3/Dummy-text"

Faker::LoremPixel.image("50x60", category: 'sports', text: 'Dummy-text') #=> "http://lorempixel.com/50/60/sports/Dummy-text"
```
