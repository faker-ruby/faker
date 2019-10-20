# Faker::LoremPixel

Available since version 1.7.0.

```ruby
# Keyword arguments: size, is_gray, category, number, text, secure
Faker::LoremPixel.image #=> "https://lorempixel.com/300/300"
Faker::LoremPixel.image(size: "50x60") #=> "https://lorempixel.com/50/60"
Faker::LoremPixel.image(size: "50x60", is_gray: true) #=> "https://lorempixel.com/g/50/60"
Faker::LoremPixel.image(size: "50x60", is_gray: false, category: 'sports') #=> "https://lorempixel.com/50/60/sports"
Faker::LoremPixel.image(size: "50x60", is_gray: false, category: 'sports', number: 3) #=> "https://lorempixel.com/50/60/sports/3"
Faker::LoremPixel.image(size: "50x60", is_gray: false, category: 'sports', number: 3, text: 'Dummy-text') #=> "https://lorempixel.com/50/60/sports/3/Dummy-text"
Faker::LoremPixel.image(size: "50x60", is_gray: false, category: 'sports', number: nil, text: 'Dummy-text') #=> "https://lorempixel.com/50/60/sports/Dummy-text"
Faker::LoremPixel.image(secure: false) #=> "http://lorempixel.com/300/300"
```
