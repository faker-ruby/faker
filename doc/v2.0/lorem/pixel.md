# Faker::Lorem::Pixel

Available since version 1.7.0.

```ruby
Faker::Lorem::Pixel.image #=> "https://lorempixel.com/300/300"

Faker::Lorem::Pixel.image("50x60") #=> "https://lorempixel.com/50/60"

Faker::Lorem::Pixel.image("50x60", true) #=> "https://lorempixel.com/g/50/60"

Faker::Lorem::Pixel.image("50x60", false, 'sports') #=> "https://lorempixel.com/50/60/sports"

Faker::Lorem::Pixel.image("50x60", false, 'sports', 3) #=> "https://lorempixel.com/50/60/sports/3"

Faker::Lorem::Pixel.image("50x60", false, 'sports', 3, 'Dummy-text') #=> "https://lorempixel.com/50/60/sports/3/Dummy-text"

Faker::Lorem::Pixel.image("50x60", false, 'sports', nil, 'Dummy-text') #=> "https://lorempixel.com/50/60/sports/Dummy-text"

Faker::Lorem::Pixel.image(secure: false) #=> "http://lorempixel.com/300/300"
```
