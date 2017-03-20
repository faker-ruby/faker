# Faker::LoremFlickr

```ruby
Faker::LoremFlickr.image #=> "http://loremflickr.com/300/300"

Faker::LoremFlickr.image("50x60") #=> "http://loremflickr.com/50/60"

Faker::LoremFlickr.image("50x60", ['sports']) #=> "http://loremflickr.com/50/60/sports"

Faker::LoremFlickr.image("50x60", ['sports', 'fitness']) #=> "http://loremflickr.com/50/60/sports,fitness"

Faker::LoremFlickr.image("50x60", ['sports', 'fitness'], true) #=> "http://loremflickr.com/50/60/sports,fitness/all"

Faker::LoremFlickr.grayscale_image #=> "http://loremflickr.com/g/300/300/all"

Faker::LoremFlickr.grayscale_image("50x60") #=> "http://loremflickr.com/g/50/60/all"

Faker::LoremFlickr.grayscale_image("50x60", ['sports']) #=> "http://loremflickr.com/g/50/60/sports"

Faker::LoremFlickr.grayscale_image("50x60", ['sports', 'fitness']) #=> "http://loremflickr.com/g/50/60/sports,fitness"

Faker::LoremFlickr.grayscale_image("50x60", ['sports', 'fitness'], true) #=> "http://loremflickr.com/g/50/60/sports,fitness/all"

Faker::LoremFlickr.pixelated_image #=> "http://loremflickr.com/p/300/300/all"

Faker::LoremFlickr.pixelated_image("50x60") #=> "http://loremflickr.com/p/50/60/all"

Faker::LoremFlickr.pixelated_image("50x60", ['sports']) #=> "http://loremflickr.com/p/50/60/sports"

Faker::LoremFlickr.pixelated_image("50x60", ['sports', 'fitness']) #=> "http://loremflickr.com/p/50/60/sports,fitness"

Faker::LoremFlickr.pixelated_image("50x60", ['sports', 'fitness'], true) #=> "http://loremflickr.com/p/50/60/sports,fitness/all"

Faker::LoremFlickr.colorized_image #=> "http://loremflickr.com/red/300/300/all"

Faker::LoremFlickr.colorized_image("50x60") #=> "http://loremflickr.com/red/50/60/all"

Faker::LoremFlickr.colorized_image("50x60", 'red') #=> "http://loremflickr.com/red/50/60/all"

Faker::LoremFlickr.colorized_image("50x60", 'red', ['sports']) #=> "http://loremflickr.com/red/50/60/sports"

Faker::LoremFlickr.colorized_image("50x60", 'red', ['sports', 'fitness']) #=> "http://loremflickr.com/red/50/60/sports,fitness"

Faker::LoremFlickr.colorized_image("50x60", 'red', ['sports', 'fitness'], true) #=> "http://loremflickr.com/red/50/60/sports,fitness/all"
```
